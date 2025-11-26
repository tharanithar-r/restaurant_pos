import { Router } from "express";
import bodyParser from "body-parser";
import {
  getWaiters,
  signinService,
  signoutService,
  signupService,
  updateMPinService,
} from "../services/auth/waiter/authService";
import { protect } from "../middlewares/auth";

const router = Router();
router.use(bodyParser.json());

router.post("/signup", signupService);
router.post("/signin", signinService);
router.post("/updateMPin", updateMPinService);
router.get("/all", getWaiters);
router.get("/signout", protect, signoutService);

export default router;
