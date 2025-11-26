import "dotenv/config";
import * as bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

interface User {
  Uname: string;
}

interface Waiter {
  WaiterName: string;
}

export const comparePasswords = async (password: string, hash: string) => {
  return await bcrypt.compare(password, hash);
};

export const hashPassword = async (password: string) => {
  return await bcrypt.hash(password, 5);
};

export const createJWT = (person: User | Waiter) => {
  // Token expires in 24 hours
  const expiresIn = 24 * 60 * 60; // 24 hours in seconds

  let id: string;
  let role: string;

  if ("Uname" in person) {
    id = person.Uname;
    role = "kitchen";
  } else if ("WaiterName" in person) {
    id = person.WaiterName;
    role = "waiter";
  } else {
    throw new Error("Invalid person object");
  }

  const token = jwt.sign({ id, role }, process.env.JWT_SECRET_KEY!, {
    expiresIn,
  });
  return token;
};

export const verifyJWT = (token: string) => {
  try {
    if (!process.env.JWT_SECRET_KEY) {
      throw new Error("JWT key is not defined");
    }

    const payload = jwt.verify(token, process.env.JWT_SECRET_KEY);
    return payload;
  } catch (error) {
    throw new Error("Error in verifying JWT");
  }
};

export const verifyTokenService = async (req: any, res: any) => {
  const token = req.cookies.jwt;
  if (!token) {
    console.log("No token provided");
    return res.status(400).json({ error: "No token provided" });
  }

  try {
    const decodedtoken = verifyJWT(token);
    if (decodedtoken) {
      res.status(200).json({ decoded: decodedtoken });
    }
  } catch (err) {
    res.status(500).json({ "Error while verifying token ": err });
  }
};
