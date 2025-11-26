import { prisma } from "../../lib/prisma";

export const deleteCartItemAction = async (
  ItemCode: string,
  CustomerID: string,
  tableNo: string
) => {
  try {
    const cartId = await prisma.tblCart.findUnique({
      where: {
        TableNo: tableNo,
      },
      select: {
        CartId: true,
      },
    });
    if (!cartId) {
      throw new Error("Cart not found");
    }

    const itemId = await prisma.cartItem.findMany({
      where: {
        CartId: cartId?.CartId,
        ItemCode: BigInt(ItemCode),
      },
      select: {
        id: true,
      },
    });

    await prisma.cartItem.delete({
      where: {
        id: itemId[0].id,
      },
    });

    const remainingItems = await prisma.cartItem.count({
      where: {
        CartId: cartId?.CartId,
      },
    });

    if (remainingItems === 0) {
      await prisma.tblCart.delete({
        where: {
          CartId: cartId?.CartId,
        },
      });
    }

    return { success: true, remainingItems };
  } catch (err) {
    console.error("Error deleting the item: ", err);
    throw new Error("Failed to delete the item");
  }
};
