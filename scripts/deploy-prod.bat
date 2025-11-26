@echo off
echo Building for Production...

cd ..
cd restaurant_pos_frontend
call npm run build

cd ../restaurant_pos_backend  
call npm run build

cd ..
call pm2 restart restaurant-pos-backend || pm2 start ecosystem.config.js --env production

echo Reloading nginx with explicit config path...

cd C:\nginx
call C:\nginx\nginx.exe -c C:\nginx\conf\nginx.conf

if errorlevel 1 (
    echo Nginx reload failed, trying to start nginx...
    call C:\nginx\nginx.exe -c C:\nginx\conf\nginx.conf
)

echo ✅ Production build deployed!
echo.
echo Access at:
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /i "IPv4" ^| findstr /v "127.0.0.1"') do (
    for /f "tokens=1" %%j in ("%%i") do (
        echo 🌐 https://%%j:8082
    )
)
pause