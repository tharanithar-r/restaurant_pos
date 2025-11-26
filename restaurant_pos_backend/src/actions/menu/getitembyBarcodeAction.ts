import { prisma } from "../../lib/prisma";

export const getitemsbyBarcodeAction = async (barcode: string) => {
  console.log(barcode);
  try {
    const data = prisma.itemmaster.findMany({
      select: {
        ItemCode: true,
        Description: true,
      },
      where: {
        BarCode: barcode,
      },
    });

    // Convert BigInt to string
    const serializedData = (await data).map((item) => {
      return {
        ...item,
        ItemCode: item.ItemCode.toString(),
      };
    });

    console.log(serializedData);

    return serializedData;
  } catch (err) {
    console.error("Error fetching item: ", err);
    throw new Error("Failed to fetch item");
  }
};
