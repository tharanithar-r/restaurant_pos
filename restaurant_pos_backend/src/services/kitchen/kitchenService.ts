import "dotenv/config";
import { allOrder } from "../../actions/kitchen/allOrder";
import { changeItemStatus } from "../../actions/kitchen/changeItemStatus";

export const allKitchenOrders = async (req: any, res: any) => {
  try {
    const orders = await allOrder();
    res.status(200).json(orders);
  } catch (err: any) {
    console.error("Error getting all orders: ", err);
    res.status(401).json(err.message);
  }
};

export const changeItemService = async (req: any, res: any) => {
  try {
    const { orderNo, tableNo, sNo, ItemCode, status } = req.body;
    await changeItemStatus(orderNo, tableNo, sNo, ItemCode, status);
    res.status(200).json("Item prepared successfully");
  } catch (err: any) {
    console.error("Error preparing item: ", err);
    res.status(401).json(err.message);
  }
};
