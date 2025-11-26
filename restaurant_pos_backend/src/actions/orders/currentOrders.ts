import { prisma } from "../../lib/prisma";

export const currentOrders = async (tableNo: string, cartId: string) => {
  console.log("Getting current orders for table: ", tableNo);
  console.log("Cart ID: ", cartId);
  try {
    const orders = await prisma.orderMaster.findMany({
      where: {
        TableNo: tableNo,
        CartId: cartId,
        NOT: {
          Status: "Billed",
        },
      },
      include: {
        itemmaster: {
          select: {
            Description: true,
          },
        },
      },
    });

    console.log("Current orders: ", orders);

    const consolidatedOrders = orders.reduce((acc: any, order: any) => {
      const existingOrder = acc.find((o: any) => o.ItemCode === order.ItemCode);
      if (existingOrder) {
        existingOrder.Qty += Number(order.Qty);
        existingOrder.Amount =
          Number(existingOrder.Amount) + Number(order.Amount);
      } else {
        acc.push({ ...order });
      }
      return acc;
    }, []);

    // Convert BigInt values to strings and map to OrderItem format
    const serializedOrders = orders.map((order: any) => ({
      OrderNO: order.OrderNO.toString(),
      Sno: order.Sno,
      ItemCode: order.ItemCode.toString(),
      Description: order.itemmaster?.Description || "",
      Rate: Number(order.Rate),
      Qty: Number(order.Qty),
      Amount: Number(order.Amount),
      Status: order.Status,
    }));

    return serializedOrders;
  } catch (err: any) {
    console.error("Error getting current orders: ", err);
    throw new Error("Error getting current orders");
  }
};
