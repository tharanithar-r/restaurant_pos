import { Router } from "express";
import bodyParser from "body-parser";
import { protect } from "../middlewares/auth";
import { getCustomerService } from "../services/customer/customerService";

const router = Router();
router.use(bodyParser.json());

router.get("/", protect, getCustomerService);

export default router;
