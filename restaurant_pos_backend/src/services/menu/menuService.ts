import "dotenv/config";
import { getCategory } from "../../actions/menu/getCategory";
import { getItems } from "../../actions/menu/getItems";
import { getitemsbyBarcodeAction } from "../../actions/menu/getitembyBarcodeAction";

export const categoryAll = async (req: any, res: any) => {
  try {
    const allCategory = await getCategory();
    res.status(200).json(allCategory);
  } catch (err: any) {
    console.error("Error updating the cart: ", err);
    res.status(401).json(err.message);
  }
};

export const itemsByCategory = async (req: any, res: any) => {
  try {
    const category = req.params.cat;
    const items = await getItems(category);
    res.status(200).json(items);
  } catch (err: any) {
    console.error("Error updating the cart: ", err);
    res.status(401).json(err.message);
  }
};

export const getItembyBarcode = async (req: any, res: any) => {
  try {
    const { barcode } = req.body;
    if (!barcode) {
      return res.status(404).json({ message: "Barcode not provided" });
    }

    const itemData = await getitemsbyBarcodeAction(barcode);
    res.status(200).json(itemData);
  } catch (err: any) {
    console.error("Error getting items: ", err);
    res.status(401).json(err.message);
  }
};
