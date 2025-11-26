import { prisma } from "../../lib/prisma";
import { createCartId, getCartId } from "./createorgetCartId";

export const updateCartAction = async (
  customerID: any,
  tableNo: any,
  item: any
) => {
  try {
    let activeCartId: string;

    activeCartId = await getCartId(tableNo);

    if (!activeCartId) {
      console.log("No active cart found");
      activeCartId = await createCartId(tableNo, customerID);
    }

    const itemId = await prisma.cartItem.findMany({
      where: {
        CartId: activeCartId,
        ItemCode: BigInt(item.ItemCode),
      },
      select: {
        id: true,
      },
    });

    console.log("Item ID: ", itemId);

    const now = new Date();

    if (!itemId.length) {
      const curItemCount = await prisma.cartItem.count({
        where: {
          CartId: activeCartId,
        },
      });

      await prisma.cartItem.create({
        data: {
          CartId: activeCartId,
          ItemCode: BigInt(item.ItemCode),
          MaxRate: item.MaxRate,
          Qty: item.Qty,
          Amount: item.Amount,
          UpdatedAt: now,
        },
      });
    } else {
      await prisma.cartItem.update({
        where: {
          id: itemId[0].id,
        },
        data: {
          Qty: item.Qty,
          Amount: item.Amount,
          UpdatedAt: now,
        },
      });
    }
  } catch (err) {
    console.error("Error updating the cart: ", err);
    throw new Error("Failed to update cart items");
  }
};
