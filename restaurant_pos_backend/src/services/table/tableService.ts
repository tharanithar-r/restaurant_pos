import { getTables } from "../../actions/table/getTables";

export const tablesActive = async (req: any, res: any) => {
  try {
    const searchuser = req.query.name;
    const tables = await getTables(searchuser);
    res.status(200).json(tables);
  } catch (err: any) {
    console.error("Error getting the tables: ", err);
    res.status(401).json(err.message);
  }
};
