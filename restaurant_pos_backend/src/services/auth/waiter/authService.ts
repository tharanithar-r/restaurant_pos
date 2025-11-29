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

    const waiter = await prisma.waiterMaster.create({
      data: {
        WaiterName: username,
        MPin: hash,
      },  
    });

    const token = createJWT(waiter);

    try {
      await res.cookie("jwt", token, setCookieOptions);
    } catch (error) {
      console.error("Error setting Cookie:", error);
      res.status(500).send("Error setting Cookie");
    }

    res.status(200).json({ message: "Created successfully", token });
  } catch (error) {
    console.error("Error creating waiter: ", error);
    res.status(400).send("Error creating waiter");
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

    await prisma.waiterMaster.update({
      data: {
        MPin: hash,
      },
      where: {
        WaiterName: username,
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

    // Get the company with its device limit
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
      const deviceLimit = company.DeviceLimit;

      if (deviceCount >= deviceLimit) {
        return res.status(403).json({ message: "Device limit exceeded" });
      }

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

    const waiter = await prisma.waiterMaster.findUnique({
      where: { WaiterName: username },
    });

    console.log("Waiter fetched:", waiter);

    if (!waiter) {
      return res.status(404).json({ message: "Waiter not found" });
    }

    // Verify Password
    if (waiter.MPin === null) {
      return res.status(404).json({ message: "MPin not set" });
    }
    const passwordValid = await comparePasswords(password, waiter.MPin!);
    console.log(passwordValid);
    if (!passwordValid) {
      return res.status(404).json({ message: "Incorrect Password" });
    }

    const token = createJWT(waiter);
    console.log("Token:", token);

    res.cookie("jwt", token, setCookieOptions);
    console.log("Cookie set successfully");

    return res.status(200).json({
      waiter: waiter.WaiterName,
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

export const getWaiters = async (req: any, res: any) => {
  try {
    console.log("Getting waiter");
    const searchwaiter = req.query.name;
    let waiters;
    if (!searchwaiter) {
      waiters = await prisma.waiterMaster.findMany({
        select: { WaiterName: true },
      });
    } else {
      waiters = await prisma.waiterMaster.findMany({
        where: {
          WaiterName: {
            contains: searchwaiter,
          },
        },
        select: { WaiterName: true },
      });
    }

    console.log(waiters);
    return res.status(200).json(waiters);
  } catch (err) {
    console.error("Error getting waiters:", err);
    return res.status(500).json({ message: "Error getting waiters" });
  }
};
