import "dotenv/config";
import { getCustomer } from "../../actions/customer/getCustomers";

export const getCustomerService = async (req: any, res: any) => {
  try {
    const searchcustomer = req.query.name;
    const customer = await getCustomer(searchcustomer);
    res.status(200).json(customer);
  } catch (err: any) {
    console.error("Error getting the customer: ", err);
    res.status(401).json(err.message);
  }
};
