import { Router } from "express";
import bodyParser from "body-parser";
import { protect } from "../middlewares/auth";
import {
  categoryAll,
  getItembyBarcode,
  itemsByCategory,
} from "../services/menu/menuService";

const router = Router();
router.use(bodyParser.json());

router.get("/category", protect, categoryAll);
router.get("/items/:cat", protect, itemsByCategory);
router.post("/barcode", protect, getItembyBarcode);

export default router;
