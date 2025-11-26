import { prisma } from "../../lib/prisma";

export const getCartId = async (tableNo: any) => {
  try {
    console.log("Getting cart for table: ", tableNo);
    let activeCart = await prisma.tblCart.findUnique({
      where: {
        TableNo: tableNo,
      },
      select: {
        CartId: true,
      },
    });

    return activeCart?.CartId || null;
  } catch (err) {
    console.error("Error getting the cart: ", err);
    throw new Error("Failed to get cart");
  }
};

export const createCartId = async (tableNo: any, customerID: any) => {
  try {
    const activeCart = await getCartId(tableNo);
    if (activeCart) {
      return activeCart;
    }

    const now = new Date();

    const newCart = await prisma.tblCart.create({
      data: {
        TableNo: tableNo,
        Customer: customerID,
        UpdatedAt: now,
      },
      select: {
        CartId: true,
      },
    });

    return newCart.CartId;
  } catch (err) {
    console.error("Error creating the cart: ", err);
    throw new Error("Failed to create cart");
  }
};
