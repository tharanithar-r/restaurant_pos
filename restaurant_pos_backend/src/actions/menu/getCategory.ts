import { prisma } from "../../lib/prisma";

export const getCategory = async () => {
  try {
    const category = await prisma.categorymaster.findMany({
      select: {
        Category: true,
      },
    });

    return category;
  } catch (err: any) {
    console.error("Error getting category: ", err);
    return { message: err.message };
  }
};
