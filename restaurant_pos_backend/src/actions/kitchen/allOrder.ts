import { prisma } from "../../lib/prisma";

export const allOrder = async () => {
  try {
    const orders = await prisma.orderMaster.findMany({
      select: {
        OrderNO: true,
        OrderDate: true,
        TableNo: true,
        Status: true,
        Sno: true,
        ItemCode: true,
        Qty: true,
        itemmaster: {
          select: {
            Description: true,
          },
        },
      },
    });

    return orders.map((order) => ({
      OrderNO: order.OrderNO.toString(),
      OrderDate: order.OrderDate,
      TableNo: order.TableNo,
      Status: order.Status,
      Sno: order.Sno,
      ItemCode: order.ItemCode.toString(),
      Qty: order.Qty,
      Description: order.itemmaster.Description,
    }));
  } catch (err: any) {
    console.error("Error getting all orders: ", err);
    throw new Error("Error getting all orders");
  }
};
