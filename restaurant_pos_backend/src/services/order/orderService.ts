import "dotenv/config";
import { insertOrderAction } from "../../actions/orders/insertOrder";
import { currentOrders } from "../../actions/orders/currentOrders";
import { getCartId } from "../../actions/cart/createorgetCartId";
import { getTables } from "../../actions/table/getTables";
import { prepItemsCount } from "../../actions/orders/prepItemsCount";
import { changeItemStatus } from "../../actions/kitchen/changeItemStatus";
import { clearCart } from "../../actions/cart/clearCart";
import { changeTableStatus } from "../../actions/table/changeTableStatus";
import { deleteOrder } from "../../actions/orders/deleteOrder";

export const newOrder = async (req: any, res: any) => {
  try {
    const { orderData, customerID, tableNo, waiter, guestCount } = req.body;
    await insertOrderAction(orderData, customerID, tableNo, waiter, guestCount);

    // Get updated table list
    const tables = await getTables("");

    res.status(200).json({
      message: "Order created successfully",
      tables,
    });
  } catch (err: any) {
    console.error("Error creating new order: ", err);
    res.status(401).json(err.message);
  }
};

export const currentOrdersService = async (req: any, res: any) => {
  try {
    const { tableNo } = req.query;
    const cartId = await getCartId(tableNo);
    const orders = await currentOrders(tableNo, cartId);
    res.status(200).json(orders);
  } catch (err: any) {
    console.error("Error getting current orders: ", err);
    res.status(401).json(err.message);
  }
};

export const prepItemsCountService = async (req: any, res: any) => {
  try {
    const prepItemsData = await prepItemsCount();
    res.status(200).json(prepItemsData);
  } catch (err: any) {
    console.error("Error getting prep items data: ", err);
    res.status(401).json(err.message);
  }
};

export const billOrderService = async (req: any, res: any) => {
  try {
    const { orders, tableNo, waiter } = req.body;

    for (const order of orders) {
      await changeItemStatus(
        order.OrderNO,
        tableNo,
        order.Sno,
        order.ItemCode,
        "Billed"
      );
    }

    await clearCart(tableNo);
    await changeTableStatus("Active", tableNo, waiter, 0);

    res.status(200).json({
      message: "Order billed successfully",
    });
  } catch (err: any) {
    console.error("Error billing order: ", err);
    res.status(401).json(err.message);
  }
};

export const deleteOrderService = async (req: any, res: any) => {
  try {
    console.log("Deleting order item: ", req.body);
    const { orderNo, sno } = req.body;
    await deleteOrder(orderNo, sno);

    res.status(200).json({
      message: "Order item deleted successfully",
    });
  } catch (err) {
    console.error("Error deleting order item: ", err);
    res.status(401).json(err.message);
  }
};
