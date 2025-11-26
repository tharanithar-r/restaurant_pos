module.exports = {
  apps: [
    {
      name: "restaurant-pos-backend",
      script: "./restaurant_pos_backend/dist/app.js",
      instances: "max",
      exec_mode: "cluster",
      cwd: "./restaurant_pos_backend",

      env: {
        NODE_ENV: "development",
        PORT: 5005,
        JWT_SECRET_KEY: process.env.JWT_SECRET_KEY,
      },
      env_production: {
        NODE_ENV: "production",
        PORT: 5005,
        JWT_SECRET_KEY: process.env.JWT_SECRET_KEY,
      },

      // Logging
      error_file: "./logs/err.log",
      out_file: "./logs/out.log",
      log_file: "./logs/combined.log",
      time: true,

      // Auto-restart configuration
      watch: false,
      max_memory_restart: "1G",
      min_uptime: "10s",
      max_restarts: 10,
      autorestart: true,
    },
  ],
};
