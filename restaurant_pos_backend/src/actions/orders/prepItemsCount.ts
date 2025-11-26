import { prisma } from "../../lib/prisma";

export const prepItemsCount = async () => {
  try {
    const prepItems = await prisma.orderMaster.groupBy({
      by: ["TableNo"],
      where: {
        Status: "Prepared",
      },
      _count: {
        _all: true,
      },
      _max: {
        ItemCode: true,
      },
    });

    return prepItems.map((item) => ({
      TableNo: item.TableNo,
      PreparedCount: item._count._all,
    }));
  } catch (err: any) {
    console.error("Error getting prep items count: ", err);
    throw new Error("Error getting prep items count");
  }
};
