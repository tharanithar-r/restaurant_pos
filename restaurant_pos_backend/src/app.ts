import "dotenv/config";
import express from "express";
import cors from "cors";
import rootRouter from "./routes/index";
import cookieparser from "cookie-parser";
import https from "https";
import fs from "fs";
import os from "os";

// Get local network IP
function getNetworkIP() {
  const interfaces = os.networkInterfaces();
  for (const interfaceName in interfaces) {
    const networkInterface = interfaces[interfaceName];
    if (networkInterface) {
      for (const alias of networkInterface) {
        if (alias.family === "IPv4" && !alias.internal) {
          return alias.address;
        }
      }
    }
  }
  return "localhost";
}

const LOCAL_IP = getNetworkIP();
const PORT = Number(process.env.PORT) || 5005;

console.log("Local IP:", LOCAL_IP);
console.log("Port:", PORT);

const corsOptions = {
  origin: [
    "http://localhost:3000",
    "http://localhost:5173",
    process.env.FRONTEND_URL,
  ],
  credentials: true,
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
  allowedHeaders: ["Content-Type", "Authorization", "Cookie", "x-device-id"],
};

console.log("Allowed CORS origins:", corsOptions.origin);

const app = express();

if (process.env.NODE_ENV === "production") {
  app.set("trust proxy", 1);
}

app.use(cors(corsOptions));
app.use(cookieparser());
app.use(express.json());

app.use("/api/v1", rootRouter);

app.get("/", async (request, response) => {
  try {
    console.log("Received GET request at /");
    response.send("Received GET request at /");
  } catch (error) {
    console.error("Error handling GET request:", error);
    response.status(500).send("An error occurred");
  }
});

// Load SSL certificate and private key
// const sslOptions = {
//   key: fs.readFileSync("D:/WebAppProjects/restaurant_pos/SSL/private.key"),
//   cert: fs.readFileSync("D:/WebAppProjects/restaurant_pos/SSL/certificate.crt"),
// };

if (process.env.NODE_ENV === "production") {
  // Create HTTPS server in production
  // http.createServer(sslOptions, app).listen(PORT, "0.0.0.0", () => {
  //   console.log(`HTTPS Server is running on port ${PORT}`);
  // });

  app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server running on port ${PORT}`);
  });
} else {
  // Create HTTP server in development
  app.listen(PORT, "0.0.0.0", () => {
    console.log(`HTTP Server is running on port ${PORT}`);
  });
}
