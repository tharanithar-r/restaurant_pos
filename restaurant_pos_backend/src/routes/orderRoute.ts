import { Router } from "express";
import bodyParser from "body-parser";
import { protect } from "../middlewares/auth";
import {
  billOrderService,
  currentOrdersService,
  deleteOrderService,
  newOrder,
  prepItemsCountService,
  insertPrintOrderService,
} from "../services/order/orderService";

const router = Router();
router.use(bodyParser.json());

router.post("/new", protect, newOrder);
router.post("/delete", protect, deleteOrderService);
router.get("/ordersbyId", protect, currentOrdersService);
router.get("/prepItemData", protect, prepItemsCountService);
router.post("/bill", protect, billOrderService);
router.post("/print", protect, insertPrintOrderService);

export default router;
