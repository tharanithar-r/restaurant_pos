import "dotenv/config";
import { prisma } from "../../../lib/prisma";
import jwt from "jsonwebtoken";
import {
  comparePasswords,
  createJWT,
  hashPassword,
  verifyJWT,
} from "../helper";
import { secretmanager } from "googleapis/build/src/apis/secretmanager";

const setCookieOptions = {
  httpOnly: true,
  secure: true, // Required for sameSite: "none"
  sameSite: "none" as const, // Allow cross-origin cookies
  path: "/",
  maxAge: 24 * 60 * 60 * 1000, // 24 hours in milliseconds
};

export const signupService = async (req: any, res: any) => {
  try {
    const { username, password } = req.body;

    console.log(username);

    // Validate input
    if (!username || !password) {
      return res
        .status(400)
        .json({ message: "Username and password are required" });
    }

    const hash = await hashPassword(password);

    const user = await prisma.userslist.create({
      data: {
        Uname: username,
        MPin: hash,
      },
      select: { Uname: true },
    });

    const token = createJWT(user);

    try {
      await res.cookie("jwt", token, setCookieOptions);
    } catch (error) {
      console.error("Error setting Cookie:", error);
      res.status(500).send("Error setting Cookie");
    }

    res.status(200).json({ message: "Created successfully", token });
  } catch (error) {
    console.error("Error creating user: ", error);
    res.status(400).send("Error creating user");
  }
};

export const updateMPinService = async (req: any, res: any) => {
  try {
    const { username, password } = req.body;
    // Validate input
    if (!username || !password) {
      return res
        .status(400)
        .json({ message: "Username and password are required" });
    }

    const hash = await hashPassword(password);

    await prisma.userslist.update({
      data: {
        MPin: hash,
      },
      where: {
        Uname: username,
      },
    });

    return res.status(200).json({ message: "MPin updated successfully" });
  } catch (err) {
    console.error("Error updating MPin:", err);
    return res.status(500).json({ message: "Error updating MPin" });
  }
};

export const signinService = async (req: any, res: any) => {
  try {
    const { username, password } = req.body;
    console.log(username);

    // Extract device ID from request headers
    const deviceId = req.headers["x-device-id"] as string;

    if (!deviceId) {
      return res.status(400).json({ message: "Device ID is required" });
    }

    const company = await prisma.company.findFirst();

    if (!company) {
      return res.status(500).json({ message: "Company not found" });
    }

    const deviceCount = await prisma.registeredDevice.count({
      where: {
        CompanyName: company.CompanyName,
        IsActive: true,
      },
    });

    const existingDevice = await prisma.registeredDevice.findUnique({
      where: {
        CompanyName_DeviceId: {
          CompanyName: company.CompanyName,
          DeviceId: deviceId,
        },
      },
    });

    if (existingDevice) {
      await prisma.registeredDevice.update({
        where: { Id: existingDevice.Id },
        data: { LastAccess: new Date() },
      });
    } else {
      const deviceLimit = company.DeviceLimit; // Default to 5 if not set

      if (deviceCount >= deviceLimit) {
        // Device limit exceeded
        return res.status(403).json({ message: "Device limit exceeded" });
      }

      // Register the new device
      await prisma.registeredDevice.create({
        data: {
          DeviceId: deviceId,
          CompanyName: company.CompanyName,
          RegisteredAt: new Date(),
          LastAccess: new Date(),
          IsActive: true,
        },
      });
    }

    const user = await prisma.userslist.findUnique({
      where: { Uname: username },
    });

    console.log("User fetched:", user);

    if (!user) {
      return res.status(404).json({ message: "UserName not found" });
    }

    // Verify Password
    if (user.MPin === null) {
      return res.status(404).json({ message: "MPin not set" });
    }
    const passwordValid = await comparePasswords(password, user.MPin!);
    console.log(passwordValid);
    if (!passwordValid) {
      return res.status(404).json({ message: "Incorrect Password" });
    }

    const token = createJWT(user);

    res.cookie("jwt", token, setCookieOptions);
    console.log("Cookie set successfully");

    return res.status(200).json({
      user: user.Uname,
      token: token,
    });
  } catch (err) {
    console.error("Error during sign in:", err);
    return res.status(500).json({ message: "Sign In Error" });
  }
};

export const signoutService = (req: any, res: any) => {
  try {
    const clearCookieOptions = {
      httpOnly: true,
      secure: true,
      sameSite: "none" as const,
      path: "/",
    };

    res
      .clearCookie("jwt", clearCookieOptions)
      .status(200)
      .json({ message: "Signout successfully" });
  } catch (error) {
    console.error("Error during signout:", error);
    return res.status(500).json({ message: "Sign out Error" });
  }
};

export const getUsers = async (req: any, res: any) => {
  try {
    console.log("Getting users");
    const searchuser = req.query.name;
    let users;
    if (!searchuser) {
      users = await prisma.userslist.findMany({
        select: { Uname: true },
      });
    } else {
      users = await prisma.userslist.findMany({
        where: {
          Uname: {
            contains: searchuser,
          },
        },
        select: { Uname: true },
      });
    }

    console.log(users);
    return res.status(200).json(users);
  } catch (err) {
    console.error("Error getting users:", err);
    return res.status(500).json({ message: "Error getting users" });
  }
};
