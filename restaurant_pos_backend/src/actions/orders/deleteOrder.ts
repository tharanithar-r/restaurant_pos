import { prisma } from "../../lib/prisma";

export const deleteOrder = async (orderNO: string, sno: number) => {
  try {
    await prisma.orderMaster.delete({
      where: {
        OrderNO_Sno: {
          OrderNO: BigInt(orderNO),
          Sno: sno,
        },
      },
    });
  } catch (err) {
    console.error("Failed to delete order:", err);
    throw new Error("Failed to delete order");
  }
};
