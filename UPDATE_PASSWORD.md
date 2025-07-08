# Update PostgreSQL Password

## Step 1: Find Your PostgreSQL Password
Remember the password you set when installing PostgreSQL. If you forgot it:
1. Open pgAdmin
2. Try to connect - it will show you if the password is wrong
3. If needed, you can reset it in PostgreSQL

## Step 2: Update the Configuration File
1. Open: `src/main/resources/application.properties`
2. Find this line:
   ```properties
   spring.datasource.password=YOUR_ACTUAL_PASSWORD
   ```
3. Replace `YOUR_ACTUAL_PASSWORD` with your actual PostgreSQL password

## Step 3: Test the Connection
After updating the password, run:
```bash
mvn spring-boot:run
```

## Step 4: Verify It's Working
1. Visit: `http://localhost:8080/api/expenses`
2. Should return: `[]` (empty array)
3. If you get an error, check:
   - Password is correct
   - PostgreSQL service is running
   - Database `expensetracker` exists

## Common Issues:
- **Wrong password**: Update the password in application.properties
- **Database doesn't exist**: Create it in pgAdmin
- **Service not running**: Check Windows Services for PostgreSQL

## Quick Commands:
- **Switch to H2**: `.\switch_to_h2.bat`
- **Switch to PostgreSQL**: `.\switch_to_postgres.bat` 