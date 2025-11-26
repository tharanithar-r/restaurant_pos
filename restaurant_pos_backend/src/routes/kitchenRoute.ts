import { Router } from "express";
import bodyParser from "body-parser";
import { protect } from "../middlewares/auth";
import {
  allKitchenOrders,
  changeItemService,
} from "../services/kitchen/kitchenService";

const router = Router();
router.use(bodyParser.json());

router.get("/all", protect, allKitchenOrders);
router.post("/changeItemStatus", protect, changeItemService);

export default router;
