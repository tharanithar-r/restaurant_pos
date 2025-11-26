import { prisma } from "../../lib/prisma";
import { getCartId } from "./createorgetCartId";

export const getCartItems = async (tableNo: any) => {
  try {
    const activeCartId: string = await getCartId(tableNo);

    // Return empty array if no cart exists for table
    if (!activeCartId) {
      return [];
    }

    const CartItems = await prisma.cartItem.findMany({
      where: {
        CartId: activeCartId,
      },
      select: {
        ItemCode: true,
        MaxRate: true,
        Qty: true,
        Amount: true,
      },
    });

    // Return empty array if no items in cart
    if (!CartItems || CartItems.length === 0) {
      return [];
    }

    const cartItemCodes = CartItems.map((item) => item.ItemCode);

    const ItemDetails = await prisma.itemmaster.findMany({
      where: {
        ItemCode: {
          in: cartItemCodes,
        },
      },
      select: {
        ItemCode: true,
        Description: true,
        ItemImage: true,
      },
    });

    const combinedResults = CartItems.map((cartItem) => {
      const relatedItemMaster = ItemDetails.find(
        (item) => item.ItemCode === cartItem.ItemCode
      );

      return {
        ...cartItem,
        ...(relatedItemMaster
          ? {
              Description: relatedItemMaster.Description,
              ItemImage: relatedItemMaster.ItemImage,
            }
          : {}),
      };
    });

    // Convert BigInt to string
    const serializedCart = (await combinedResults).map((item) => {
      return {
        ...item,
        // Assuming item has BigInt fields, e.g., id, replace with actual field names
        ItemCode: item.ItemCode.toString(),
        ItemImage:
          item.ItemImage instanceof Buffer
            ? item.ItemImage.toString("base64")
            : "",
        // Add other fields if needed
      };
    });

    return serializedCart;
  } catch (err) {
    console.error("Error fetching cart items: ", err);
    throw new Error("Failed to fetch cart items");
  }
};
