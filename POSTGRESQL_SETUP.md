# Setting up PostgreSQL on Your Laptop

## Method 1: Download PostgreSQL Installer (Recommended)

### Step 1: Download PostgreSQL
1. Go to: https://www.postgresql.org/download/windows/
2. Click "Download the installer"
3. Download the latest version (e.g., PostgreSQL 15.x)

### Step 2: Install PostgreSQL
1. Run the installer as Administrator
2. Choose installation directory (default is fine)
3. **Important**: Remember the password you set for the `postgres` user!
4. Keep default port (5432)
5. Complete the installation

### Step 3: Create Database
1. Open "pgAdmin" (comes with PostgreSQL)
2. Connect to the server using your password
3. Right-click on "Databases" → "Create" → "Database"
4. Name it: `expensetracker`
5. Click "Save"

### Step 4: Update Application Configuration
Edit `src/main/resources/application.properties`:

```properties
# Database Configuration
spring.datasource.url=jdbc:postgresql://localhost:5432/expensetracker
spring.datasource.username=postgres
spring.datasource.password=your_password_here
spring.datasource.driver-class-name=org.postgresql.Driver

# JPA Configuration
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
spring.jpa.properties.hibernate.format_sql=true

# Comment out H2 configuration
# spring.datasource.url=jdbc:h2:mem:expensetracker
# spring.datasource.driver-class-name=org.h2.Driver
# spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
```

Replace `your_password_here` with the password you set during installation.

## Method 2: Using Docker (Alternative)

If you have Docker installed:

```bash
# Run PostgreSQL in Docker
docker run --name postgres-expensetracker -e POSTGRES_PASSWORD=password -e POSTGRES_DB=expensetracker -p 5432:5432 -d postgres:15

# Then use these settings in application.properties:
# spring.datasource.url=jdbc:postgresql://localhost:5432/expensetracker
# spring.datasource.username=postgres
# spring.datasource.password=password
```

## Method 3: Using Chocolatey (Windows Package Manager)

If you have Chocolatey installed:

```powershell
# Install PostgreSQL
choco install postgresql

# Then follow steps 3-4 above
```

## Testing the Setup

1. **Start your Spring Boot application:**
   ```bash
   mvn spring-boot:run
   ```

2. **Test the API:**
   - Visit: `http://localhost:8080/api/expenses`
   - Should return: `[]` (empty array)

3. **Add a test expense:**
   ```bash
   curl -X POST http://localhost:8080/api/expenses \
   -H "Content-Type: application/json" \
   -d '{
     "title": "Test Expense",
     "amount": 25.50,
     "category": "Food",
     "date": "2024-01-15",
     "description": "Test expense"
   }'
   ```

## Troubleshooting

### Connection Issues
- Make sure PostgreSQL service is running
- Check if port 5432 is not blocked by firewall
- Verify username/password in application.properties

### Service Not Starting
- Open Services (services.msc)
- Find "postgresql-x64-15" service
- Make sure it's running

### Port Already in Use
- Change port in application.properties:
  ```properties
  server.port=8081
  ```

## Benefits of Local PostgreSQL
- ✅ No network dependencies
- ✅ Better performance
- ✅ Full control over database
- ✅ Can use pgAdmin for database management
- ✅ Data persists between application restarts 