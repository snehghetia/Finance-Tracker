@echo off
echo Packaging entire Expense Tracker project...

REM Create a directory for the package
if exist "expensetracker_complete" rmdir /s /q "expensetracker_complete"
mkdir "expensetracker_complete"

REM Copy backend files
echo Copying backend files...
xcopy /E /I /Y "src" "expensetracker_complete\backend\src"
copy "pom.xml" "expensetracker_complete\backend\"
copy "mvnw" "expensetracker_complete\backend\"
copy "mvnw.cmd" "expensetracker_complete\backend\"

REM Copy frontend files (React files are in root directory)
echo Copying frontend files...
mkdir "expensetracker_complete\frontend"
copy "package.json" "expensetracker_complete\frontend\"
copy "package-lock.json" "expensetracker_complete\frontend\"
copy "tsconfig.json" "expensetracker_complete\frontend\"
copy "tailwind.config.js" "expensetracker_complete\frontend\"
copy "postcss.config.js" "expensetracker_complete\frontend\"
copy "README.md" "expensetracker_complete\frontend\"

REM Copy frontend source files
if exist "src" (
    xcopy /E /I /Y "src" "expensetracker_complete\frontend\src"
)

REM Copy public folder if it exists
if exist "public" (
    xcopy /E /I /Y "public" "expensetracker_complete\frontend\public"
)

REM Copy documentation and setup files
echo Copying documentation...
if exist "SETUP_FOR_FRIEND.md" copy "SETUP_FOR_FRIEND.md" "expensetracker_complete\"
if exist "POSTGRESQL_SETUP.md" copy "POSTGRESQL_SETUP.md" "expensetracker_complete\"
if exist "UPDATE_PASSWORD.md" copy "UPDATE_PASSWORD.md" "expensetracker_complete\"

REM Create a comprehensive README
echo Creating comprehensive README...
(
echo # Expense Tracker - Complete Project
echo.
echo This project contains both the backend ^(Spring Boot^) and frontend ^(React^) for a complete expense tracking application.
echo.
echo ## Project Structure
echo.
echo - `backend/` - Spring Boot application with PostgreSQL database
echo - `frontend/` - React TypeScript application
echo - `SETUP_FOR_FRIEND.md` - Setup instructions for running on another machine
echo - `POSTGRESQL_SETUP.md` - PostgreSQL installation and configuration guide
echo - `UPDATE_PASSWORD.md` - Database password update instructions
echo.
echo ## Quick Start
echo.
echo ### Backend Setup
echo 1. Navigate to the `backend` directory
echo 2. Install PostgreSQL and create database 'expensetracker'
echo 3. Update database password in `src/main/resources/application.properties`
echo 4. Run: `mvn spring-boot:run`
echo.
echo ### Frontend Setup
echo 1. Navigate to the `frontend` directory
echo 2. Run: `npm install`
echo 3. Run: `npm start`
echo 4. Open http://localhost:3000
echo.
echo ## Features
echo.
echo - Add and manage income and expenses
echo - View financial analytics and charts
echo - Dashboard with summary statistics
echo - PostgreSQL database for data persistence
echo - Modern React UI with Tailwind CSS
echo.
echo ## Currency
echo.
echo The application displays amounts in Indian Rupees ^(₹^).
echo.
echo ## Database
echo.
echo - PostgreSQL 17.5 recommended
echo - Database name: expensetracker
echo - Tables: income, expense
echo.
echo ## API Endpoints
echo.
echo - GET /api/expenses - List all expenses
echo - POST /api/expenses - Add new expense
echo - GET /api/income - List all income
echo - POST /api/income - Add new income
echo - GET /api/stats - Get financial statistics
echo.
echo ## Ports
echo.
echo - Backend: http://localhost:8080
echo - Frontend: http://localhost:3000
echo - Database: localhost:5432
) > "expensetracker_complete\README.md"

REM Create a zip file
echo Creating zip file...
powershell Compress-Archive -Path "expensetracker_complete" -DestinationPath "expensetracker_complete.zip" -Force

REM Clean up
rmdir /s /q "expensetracker_complete"

echo.
echo ========================================
echo Package created successfully!
echo ========================================
echo.
echo Files created:
echo - expensetracker_complete.zip ^(ready to share^)
echo.
echo Package includes:
echo - Complete backend ^(Spring Boot^)
echo - Complete frontend ^(React^)
echo - Setup documentation
echo - Comprehensive README
echo.
echo You can now share this zip file with others!
echo.
pause 