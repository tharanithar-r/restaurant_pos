import { Router } from "express";
import bodyParser from "body-parser";
import { protect } from "../middlewares/auth";
import {
  deleteCartItem,
  getActiveCartWaiter,
  syncCart,
  updateCart,
} from "../services/cart/cartService";

const router = Router();
router.use(bodyParser.json());

router.put("/update", protect, updateCart);
router.post("/sync", protect, syncCart);
router.delete("/delete", protect, deleteCartItem);
//router.get("/activeCartWaiter", protect, getActiveCartWaiter);

export default router;
