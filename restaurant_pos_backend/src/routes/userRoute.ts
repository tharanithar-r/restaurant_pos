import { Router } from "express";
import bodyParser from "body-parser";
import {
  getUsers,
  signinService,
  signoutService,
  signupService,
  updateMPinService,
} from "../services/auth/user/authService";
import { protect } from "../middlewares/auth";

const router = Router();
router.use(bodyParser.json());

router.post("/signup", signupService);
router.post("/signin", signinService);
router.post("/updateMPin", updateMPinService);
router.get("/all", getUsers);
router.get("/signout", protect, signoutService);

export default router;
