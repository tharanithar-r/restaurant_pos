import { prisma } from "../../lib/prisma";

export const changeItemStatus = async (
  orderNo,
  tableNo,
  sNo,
  ItemCode,
  status
) => {
  try {
    await prisma.orderMaster.update({
      where: {
        OrderNO_Sno: {
          OrderNO: orderNo,
          Sno: sNo,
        },
        TableNo: tableNo,
        ItemCode: ItemCode,
      },
      data: {
        Status: status,
      },
    });
  } catch (err: any) {
    console.error("Error preparing item: ", err);
    throw new Error("Error preparing item");
  }
};
