import "dotenv/config";
import { updateCartAction } from "../../actions/cart/updateCart";
import { getCartItems } from "../../actions/cart/getCart";
import { deleteCartItemAction } from "../../actions/cart/delCartItem";
import { activeCartbyWaiter } from "../../actions/cart/activeCartbyWaiter";

export const updateCart = async (req: any, res: any) => {
  const { customerID, tableNo, items } = req.body;
  try {
    await updateCartAction(customerID, tableNo, items);
    const updatedCart = await getCartItems(tableNo);
    res.status(200).json(updatedCart);
  } catch (err: any) {
    console.error("Error updating the cart: ", err);
    res.status(401).json(err.message);
  }
};

export const syncCart = async (req: any, res: any) => {
  const { customerID, tableNo } = req.body;
  try {
    const syncedCart = await getCartItems(tableNo);
    res.status(200).json(syncedCart);
  } catch (err: any) {
    console.error("Error syncing the cart: ", err);
    res.status(401).json(err.message);
  }
};

export const deleteCartItem = async (req: any, res: any) => {
  const { ItemCode, CustomerID, tableNo } = req.body;
  try {
    const data = await deleteCartItemAction(ItemCode, CustomerID, tableNo);
    res.status(200).json(data);
  } catch (err: any) {
    console.error("Error deleting the item from Cart: ", err);
    res.status(401).json(err.message);
  }
};

export const getActiveCartWaiter = async (req: any, res: any) => {
  const { waiter } = req.body;
  try {
    const data = await activeCartbyWaiter(waiter);
    res.status(200).json(data);
  } catch (err: any) {
    console.error("Error getting active cart by waiter: ", err);
    res.status(401).json(err.message);
  }
};
