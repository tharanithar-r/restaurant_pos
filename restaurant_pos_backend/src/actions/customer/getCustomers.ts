import { prisma } from "../../lib/prisma";

export const getCustomer = async (searchcustomer: string) => {
  try {
    let customer;
    if (!searchcustomer) {
      customer = await prisma.customermaster.findMany({
        select: {
          Customer: true,
          CustomerName: true,
        },
      });
    } else {
      customer = await prisma.customermaster.findMany({
        where: {
          CustomerName: {
            contains: searchcustomer,
          },
        },
        select: {
          Customer: true,
          CustomerName: true,
        },
      });
    }

    const serializedData = (await customer).map((item) => {
      return {
        ...item,
        Customer: item.Customer.toString(),
      };
    });

    return serializedData;
  } catch (err: any) {
    console.error("Error getting customer: ", err);
    return { message: err.message };
  }
};
