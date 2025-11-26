import { prisma } from "../../lib/prisma";

export const getTables = async (searchTable: string) => {
  try {
    let tables;
    if (searchTable) {
      tables = await prisma.tablemaster.findMany({
        select: {
          TableNo: true,
          TableStatus: true,
          NoOfGuests: true,
          WaiterName: true,
        },
        where: {
          TableNo: {
            contains: searchTable,
          },
        },
      });
    } else {
      tables = await prisma.tablemaster.findMany({
        select: {
          TableNo: true,
          TableStatus: true,
          NoOfGuests: true,
          WaiterName: true,
        },
      });
    }

    return tables;
  } catch (err: any) {
    console.error("Error getting tables: ", err);
    return { message: err.message };
  }
};
