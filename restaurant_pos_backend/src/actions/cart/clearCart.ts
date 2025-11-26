import { prisma } from "../../lib/prisma";

export const clearCart = async (tableNo: string) => {
  try {
    const cartId = await prisma.tblCart.findUnique({
      where: {
        TableNo: tableNo,
      },
      select: {
        CartId: true,
      },
    });

    await prisma.cartItem.deleteMany({
      where: {
        CartId: cartId?.CartId,
      },
    });

    const existingOrders = await prisma.orderMaster.findMany({
      where: {
        CartId: cartId.CartId,
      },
    });

    if (existingOrders.length === 0) {
      await prisma.tblCart.delete({
        where: {
          CartId: cartId?.CartId,
        },
      });
    }

    const isOrdersBilled = existingOrders.every(
      (order) => order.Status === "Billed"
    );

    if (isOrdersBilled) {
      await prisma.tblCart.delete({
        where: {
          CartId: cartId?.CartId,
        },
      });
    }
  } catch (err: any) {
    console.error("Error clearing the cart: ", err);
    throw new Error("Failed to clear cart");
  }
};
