@echo off
echo Packaging Expense Tracker for your friend...

REM Create a directory for the package
if exist "expensetracker_for_friend" rmdir /s /q "expensetracker_for_friend"
mkdir "expensetracker_for_friend"

REM Copy all project files
xcopy /E /I /Y "src" "expensetracker_for_friend\src"
copy "pom.xml" "expensetracker_for_friend\"
copy "SETUP_FOR_FRIEND.md" "expensetracker_for_friend\"

REM Create a zip file
powershell Compress-Archive -Path "expensetracker_for_friend" -DestinationPath "expensetracker_for_friend.zip" -Force

echo.
echo ========================================
echo Package created successfully!
echo ========================================
echo.
echo Files created:
echo - expensetracker_for_friend.zip (ready to send to your friend)
echo - SETUP_FOR_FRIEND.md (setup instructions)
echo.
echo Send the zip file to your friend and ask them to:
echo 1. Extract the zip file
echo 2. Follow the instructions in SETUP_FOR_FRIEND.md
echo 3. Update the database connection details
echo 4. Run: mvn spring-boot:run
echo.
pause 