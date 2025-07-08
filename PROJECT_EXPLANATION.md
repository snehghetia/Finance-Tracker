# Expense Tracker Application - Technical Documentation

## Overview
This is a full-stack expense tracking application built with **Spring Boot (Backend)** and **React TypeScript (Frontend)**. The application allows users to track their income and expenses with a modern web interface.

## Architecture

### Technology Stack
- **Backend**: Spring Boot 3.5.3 with Java 21
- **Frontend**: React with TypeScript
- **Database**: PostgreSQL 17.5
- **Build Tool**: Maven
- **ORM**: Hibernate/JPA

## Backend (Spring Boot)

### Project Structure
```
src/main/java/com/financetracker/expensetracker/
├── controller/          # REST API endpoints
├── entity/             # Database models
├── repository/         # Data access layer
├── services/          # Business logic
└── ExpensetrackerApplication.java  # Main application class
```

### Key Components

#### 1. Entities (Database Models)
- **Expense.java**: Represents expense records with fields like amount, category, date, description, title
- **Income.java**: Represents income records with similar structure

#### 2. Controllers (REST API)
- **ExpenseController**: Handles CRUD operations for expenses
- **IncomeController**: Handles CRUD operations for income
- **StatsController**: Provides aggregated statistics and analytics

#### 3. Services (Business Logic)
- **ExpenseService**: Business logic for expense operations
- **IncomeService**: Business logic for income operations
- **StatsService**: Calculates statistics like total income, expenses, balance

#### 4. Repositories (Data Access)
- **ExpenseRepository**: Database operations for expenses
- **IncomeRepository**: Database operations for income

### API Endpoints
```
GET    /api/expenses     - Get all expenses
POST   /api/expenses     - Create new expense
GET    /api/income       - Get all income
POST   /api/income       - Create new income
GET    /api/stats        - Get statistics
GET    /api/graph        - Get data for charts
```

## Frontend (React TypeScript)

### Project Structure
```
src/
├── App.tsx             # Main application component
├── index.tsx           # Application entry point
├── components/         # Reusable UI components
├── services/          # API service functions
└── types/             # TypeScript type definitions
```

### Key Features
- **Modern UI**: Clean, responsive design with Material-UI components
- **Real-time Updates**: Automatic refresh of data when changes occur
- **Charts & Analytics**: Visual representation of income/expense trends
- **Date Filtering**: Filter data by date ranges
- **Currency Display**: Shows amounts in Indian Rupees (₹)

### Components
- **Dashboard**: Main overview with statistics and charts
- **Expense Form**: Add new expense entries
- **Income Form**: Add new income entries
- **Transaction Lists**: Display all income and expenses
- **Charts**: Visual analytics using Chart.js

## Database Connection

### Configuration
The application connects to **PostgreSQL** using the following configuration:

```properties
# Database Configuration
spring.datasource.url=jdbc:postgresql://localhost:5432/expensetracker
spring.datasource.username=postgres
spring.datasource.password=Ashdon123
spring.datasource.driver-class-name=org.postgresql.Driver

# JPA Configuration
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
```

### Database Schema
- **expense table**: Stores expense records
- **income table**: Stores income records

## How Frontend and Backend Connect

### 1. REST API Communication
The frontend communicates with the backend through **REST API calls**:

```typescript
// Frontend API service example
const API_BASE_URL = 'http://localhost:8080/api';

export const getExpenses = async () => {
  const response = await fetch(`${API_BASE_URL}/expenses`);
  return response.json();
};
```

### 2. CORS Configuration
The backend is configured to allow requests from the frontend:

```properties
# CORS Configuration
spring.web.cors.allowed-origins=http://localhost:3000
spring.web.cors.allowed-methods=GET,POST,PUT,DELETE
spring.web.cors.allowed-headers=*
```

### 3. Data Flow
1. **User Action**: User clicks "Add Expense" in frontend
2. **Frontend Request**: React sends POST request to `/api/expenses`
3. **Backend Processing**: Spring Boot controller receives request
4. **Database Operation**: Service layer saves data to PostgreSQL
5. **Response**: Backend returns success/error response
6. **UI Update**: Frontend updates the display with new data

## Running the Application

### Backend
```bash
# Navigate to project directory
cd expensetracker

# Start Spring Boot application
mvn spring-boot:run
```
- **URL**: http://localhost:8080
- **API Base**: http://localhost:8080/api

### Frontend
```bash
# Install dependencies (if not already done)
npm install

# Start React development server
npm start
```
- **URL**: http://localhost:3000

## Key Features Explained

### 1. Real-time Statistics
- **Backend**: `StatsService` calculates totals, balances, and trends
- **Frontend**: Displays statistics in dashboard with automatic updates

### 2. Data Visualization
- **Backend**: Provides aggregated data for charts via `/api/graph`
- **Frontend**: Renders charts using Chart.js library

### 3. Date Filtering
- **Backend**: Repository methods support date range queries
- **Frontend**: Date picker component filters data by selected range

### 4. Currency Display
- **Frontend**: Displays amounts in Indian Rupees (₹) format
- **Backend**: Stores amounts as integers (in paise for precision)

## Error Handling

### Backend Error Handling
- **Controller Level**: `@ExceptionHandler` for API errors
- **Service Level**: Business logic validation
- **Repository Level**: Database constraint handling

### Frontend Error Handling
- **API Calls**: Try-catch blocks for network errors
- **User Feedback**: Toast notifications for success/error states
- **Form Validation**: Client-side validation before API calls

## Security Considerations

### Backend Security
- **CORS**: Configured to allow only frontend origin
- **Input Validation**: Service layer validates all inputs
- **SQL Injection**: Prevented by using JPA/Hibernate

### Frontend Security
- **XSS Prevention**: React automatically escapes user input
- **CSRF**: Not implemented (stateless API design)

## Performance Optimizations

### Backend
- **Connection Pooling**: HikariCP for database connections
- **Caching**: JPA second-level cache (disabled in current config)
- **Query Optimization**: Repository methods use efficient SQL

### Frontend
- **Component Optimization**: React.memo for expensive components
- **API Caching**: Minimal caching (real-time updates preferred)
- **Bundle Optimization**: Webpack optimizations for production

## Deployment Considerations

### Backend Deployment
- **JAR File**: `mvn clean package` creates executable JAR
- **Database**: Requires PostgreSQL server
- **Environment Variables**: Configure database connection

### Frontend Deployment
- **Build**: `npm run build` creates optimized production build
- **Static Hosting**: Can be deployed to any static hosting service
- **API Configuration**: Update API base URL for production

## Monitoring and Logging

### Backend Logging
- **Application Logs**: Spring Boot logging with different levels
- **SQL Logging**: Hibernate shows SQL queries (enabled in dev)
- **Performance**: HikariCP connection pool monitoring

### Frontend Logging
- **Console Logs**: Development debugging
- **Error Boundaries**: React error boundary for component errors
- **Network Monitoring**: Browser dev tools for API calls

## Future Enhancements

### Potential Improvements
1. **Authentication**: User login and session management
2. **Categories**: Predefined expense/income categories
3. **Export**: PDF/Excel export functionality
4. **Notifications**: Email/SMS reminders
5. **Mobile App**: React Native version
6. **Cloud Deployment**: AWS/Azure deployment
7. **Docker**: Containerization for easy deployment

## Troubleshooting

### Common Issues
1. **Database Connection**: Ensure PostgreSQL is running on port 5432
2. **CORS Errors**: Check CORS configuration in application.properties
3. **Port Conflicts**: Ensure ports 8080 (backend) and 3000 (frontend) are free
4. **Build Errors**: Clean and rebuild with `mvn clean install`

This application demonstrates a complete full-stack development approach with modern technologies and best practices for building scalable web applications. 