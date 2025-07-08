@echo off
echo Switching to PostgreSQL configuration...

REM Backup current configuration
copy "src\main\resources\application.properties" "src\main\resources\application.properties.backup"

REM Create PostgreSQL configuration
echo # Database Configuration > "src\main\resources\application.properties"
echo spring.datasource.url=jdbc:postgresql://localhost:5432/expensetracker >> "src\main\resources\application.properties"
echo spring.datasource.username=postgres >> "src\main\resources\application.properties"
echo spring.datasource.password=your_password_here >> "src\main\resources\application.properties"
echo spring.datasource.driver-class-name=org.postgresql.Driver >> "src\main\resources\application.properties"
echo. >> "src\main\resources\application.properties"
echo # JPA Configuration >> "src\main\resources\application.properties"
echo spring.jpa.hibernate.ddl-auto=update >> "src\main\resources\application.properties"
echo spring.jpa.show-sql=true >> "src\main\resources\application.properties"
echo spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect >> "src\main\resources\application.properties"
echo spring.jpa.properties.hibernate.format_sql=true >> "src\main\resources\application.properties"
echo. >> "src\main\resources\application.properties"
echo # Server Configuration >> "src\main\resources\application.properties"
echo server.port=8080 >> "src\main\resources\application.properties"
echo. >> "src\main\resources\application.properties"
echo # CORS Configuration >> "src\main\resources\application.properties"
echo spring.web.cors.allowed-origins=http://localhost:3000 >> "src\main\resources\application.properties"
echo spring.web.cors.allowed-methods=GET,POST,PUT,DELETE >> "src\main\resources\application.properties"
echo spring.web.cors.allowed-headers=* >> "src\main\resources\application.properties"

echo.
echo ========================================
echo PostgreSQL configuration applied!
echo ========================================
echo.
echo IMPORTANT: Update the password in application.properties
echo Change 'your_password_here' to your actual PostgreSQL password
echo.
echo To switch back to H2, run: switch_to_h2.bat
echo.
pause 