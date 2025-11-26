import { Router } from "express";
import bodyParser from "body-parser";
import { protect } from "../middlewares/auth";
import { tablesActive } from "../services/table/tableService";

const router = Router();
router.use(bodyParser.json());

router.get("/getTables", protect, tablesActive);

export default router;
