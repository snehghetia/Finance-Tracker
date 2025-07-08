@echo off
echo Switching back to H2 configuration...

REM Restore H2 configuration
copy "src\main\resources\application.properties.backup" "src\main\resources\application.properties"

echo.
echo ========================================
echo H2 configuration restored!
echo ========================================
echo.
echo Your application will now use H2 in-memory database
echo Data will be lost when you restart the application
echo.
echo To switch to PostgreSQL, run: switch_to_postgres.bat
echo.
pause 