import { prisma } from "../../lib/prisma";

export const changeTableStatus = async (
  curStatus: string,
  tableNo: string,
  waiter: string,
  guestcount?: number
) => {
  try {
    if (curStatus === "Active") {
      await prisma.tablemaster.update({
        data: {
          TableStatus: null,
          WaiterName: null,
          NoOfGuests: null,
        },
        where: {
          TableNo: tableNo,
        },
      });
    } else if (curStatus === null) {
      await prisma.tablemaster.update({
        data: {
          TableStatus: "Active",
          WaiterName: waiter,
          NoOfGuests: guestcount,
        },
        where: {
          TableNo: tableNo,
        },
      });
    }
  } catch (err: any) {
    console.error("Error changing the table status: ", err);
    return { message: err.message };
  }
};
