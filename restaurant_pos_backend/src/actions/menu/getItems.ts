import { prisma } from "../../lib/prisma";

export const getItems = async (category: string) => {
  try {
    let items;
    if (category === "All") {
      items = await prisma.itemmaster.findMany();
    } else {
      items = await prisma.itemmaster.findMany({
        where: {
          Category: category,
        },
      });
    }

    const serializedData = items.map((item) => {
      return {
        ...item,
        ItemCode: item.ItemCode.toString(),
        ItemImage: item.ItemImage
          ? Buffer.from(item.ItemImage).toString("base64")
          : "",
      };
    });

    return serializedData;
  } catch (err: any) {
    console.error("Error getting items: ", err);
    return { message: err.message };
  }
};
