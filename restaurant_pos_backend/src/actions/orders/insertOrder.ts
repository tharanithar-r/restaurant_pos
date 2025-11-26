import { prisma } from "../../lib/prisma";
import { clearCart } from "../cart/clearCart";
import { changeTableStatus } from "../table/changeTableStatus";

const getCurrentISTDateTime = () => {
  const now = new Date();
  const istOffset = 330; // IST is UTC+5:30 (330 minutes)
  const localOffset = now.getTimezoneOffset();
  return new Date(now.getTime() + (istOffset + localOffset) * 60000);
};

export const insertOrderAction = async (
  orderData: any,
  customerID: any,
  tableNo: any,
  waiter: any,
  guestCount?: any
) => {
  try {
    const cartId = await prisma.tblCart.findUnique({
      where: { TableNo: tableNo },
    });

    // Check for existing non-billed orders
    const existingOrder = await prisma.orderMaster.findFirst({
      where: {
        TableNo: tableNo,
        Status: { not: "Billed" },
      },
      orderBy: { Sno: "desc" },
    });

    let orderNo;
    let startSno;

    if (existingOrder) {
      // Use existing order number and increment last Sno
      orderNo = existingOrder.OrderNO;
      startSno = existingOrder.Sno;
    } else {
      // Get last order number from orderMaster
      const lastOrder = await prisma.orderMaster.findFirst({
        orderBy: { OrderNO: "desc" },
      });
      orderNo = lastOrder ? BigInt(lastOrder.OrderNO) + BigInt(1) : BigInt(1);
      startSno = 0;
    }

    // Insert new items
    await Promise.all(
      orderData.items.map((item: any, index: number) => {
        const { MaxRate } = item;
        return prisma.orderMaster.create({
          data: {
            OrderNO: orderNo,
            OrderDate: getCurrentISTDateTime(),
            CartId: cartId?.CartId,
            Customer: customerID,
            TableNo: tableNo,
            WaiterName: waiter,
            Sno: startSno + index + 1,
            ItemCode: item.ItemCode,
            Qty: item.Qty,
            Rate: MaxRate,
            Amount: Number(item.Qty) * Number(MaxRate),
            Status: "Order",
            RateType: "AC",
          },
        });
      })
    );

    // Update table status if new order
    if (!existingOrder) {
      await changeTableStatus(null, tableNo, waiter, guestCount);
    }

    await clearCart(tableNo);
  } catch (err: any) {
    console.error("Error inserting order: ", err);
    throw new Error("Error inserting order");
  }
};
