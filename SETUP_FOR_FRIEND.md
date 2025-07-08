# Expense Tracker Setup Guide

## Prerequisites
- Java 17 or higher
- Maven
- PostgreSQL database (already set up)

## Setup Steps

### 1. Extract the project
- Extract the project files to a folder on your laptop
- Open terminal/command prompt in that folder

### 2. Update database configuration
Edit `src/main/resources/application.properties` and update these lines:

```properties
# Database Configuration
spring.datasource.url=jdbc:postgresql://localhost:5432/your_database_name
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.datasource.driver-class-name=org.postgresql.Driver

# JPA Configuration
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
spring.jpa.properties.hibernate.format_sql=true

# Comment out or remove H2 configuration
# spring.datasource.url=jdbc:h2:mem:expensetracker
# spring.datasource.driver-class-name=org.h2.Driver
# spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
```

Replace:
- `your_database_name` with your actual database name
- `your_username` with your PostgreSQL username
- `your_password` with your PostgreSQL password

### 3. Add PostgreSQL dependency (if not already present)
Make sure `pom.xml` has this dependency:

```xml
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <scope>runtime</scope>
</dependency>
```

### 4. Run the application
```bash
mvn spring-boot:run
```

The application will start on `http://localhost:8080`

### 5. Test the API
You can test if it's working by visiting:
- `http://localhost:8080/api/expenses` (should return empty array `[]`)
- `http://localhost:8080/api/stats` (should return stats with 0 values)

### 6. Frontend (Optional)
If you want to run the frontend too:
1. Navigate to the frontend folder
2. Run `npm install`
3. Run `npm start`
4. Frontend will be available at `http://localhost:3000`

## Troubleshooting

### Database Connection Issues
- Make sure PostgreSQL is running
- Verify database name, username, and password
- Check if PostgreSQL is listening on port 5432

### Port Issues
- If port 8080 is busy, change it in `application.properties`:
  ```properties
  server.port=8081
  ```

### Java Version
- Make sure you have Java 17 or higher: `java -version`

## API Endpoints

- `GET /api/expenses` - Get all expenses
- `POST /api/expenses` - Add new expense
- `GET /api/incomes` - Get all incomes  
- `POST /api/incomes` - Add new income
- `GET /api/stats` - Get statistics

## Sample Data

You can test with this sample expense:
```json
{
  "title": "Lunch",
  "amount": 15.50,
  "category": "Food",
  "date": "2024-01-15",
  "description": "Lunch at restaurant"
}
``` 