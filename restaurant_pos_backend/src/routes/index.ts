import express from "express";
import userRoute from "./userRoute";
import waiterRoute from "./waiterRoute";
import menuRoute from "./menuRoute";
import cartRoute from "./cartRoute";
import orderRoute from "./orderRoute";
import customerRoute from "./customerRoute";
import tableRoute from "./tableRoute";
import kitchenRoute from "./kitchenRoute";
import { verifyTokenService } from "../services/auth/helper";
import { protect } from "../middlewares/auth";

const router = express.Router();

router.use("/user", userRoute);
router.use("/waiter", waiterRoute);
router.use("/menu", menuRoute);
router.use("/cart", cartRoute);
router.use("/order", orderRoute);
router.use("/customer", customerRoute);
router.use("/table", tableRoute);
router.use("/kitchen", kitchenRoute);
router.get("/verifyToken", verifyTokenService);
export default router;
