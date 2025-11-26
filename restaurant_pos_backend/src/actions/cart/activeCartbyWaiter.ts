import { prisma } from "../../lib/prisma";

export const activeCartbyWaiter = async (waiter: string) => {
  // try {
  //   const carts = await prisma.tblCart.findMany({
  //     where: {
  //       WaiterName: waiter,
  //     },
  //     select: {
  //       CartId: true,
  //       TableNo: true,
  //       Customer: true,
  //       customer: {
  //         select: {
  //           CustomerName: true,
  //         },
  //       },
  //     },
  //   });
  //   const cartDetails = await Promise.all(
  //     carts.map(async (cart) => {
  //       const orders = await prisma.orderMaster.findMany({
  //         where: {
  //           CartId: cart.CartId,
  //           TableNo: cart.TableNo,
  //         },
  //         // select: {
  //         //   Customer: true,
  //         //   Status: true,
  //         // },
  //       });
  //       const itemCount = orders.length;
  //       // const status = orders.map((order) => order.Status);
  //       return {
  //         cartId: cart.CartId,
  //         tableNo: cart.TableNo,
  //         itemCount: itemCount,
  //         customerID: cart.Customer.toString(),
  //         customerName: cart.customer?.CustomerName || "",
  //       };
  //     })
  //   );
  //   return cartDetails;
  // } catch (error) {
  //   console.error("Failed to get active cart by waiter:", error);
  //   throw new Error("Failed to get active cart by waiter");
  // }
};
