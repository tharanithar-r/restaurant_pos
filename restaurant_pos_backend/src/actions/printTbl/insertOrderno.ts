import { prisma } from "../../lib/prisma";

export const insertprtOrderNo = async (orderNo: string) => {
  try {
    if (!orderNo) {
      return null;
    }

    const printRecord = await prisma.printTbl.create({
      data: {
        OrderNo: BigInt(orderNo),
      },
    });

    return {
      OrderNo: printRecord.OrderNo.toString(),
      PrintStatus: printRecord.PrintStatus,
    };
  } catch (err: any) {
    console.error("Error inserting print order: ", err);
    return { message: err.message };
  }
};
