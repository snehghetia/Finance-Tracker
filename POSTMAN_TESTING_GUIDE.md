# 🧪 Postman Testing Guide for Expense Tracker API

## 📋 **Prerequisites**
- ✅ Spring Boot application running on `http://localhost:8080`
- ✅ PostgreSQL database connected
- ✅ Postman installed

---

## 🚀 **Step-by-Step Testing**

### **1. GET All Expenses**
```
Method: GET
URL: http://localhost:8080/api/expense/all
Headers: None required
Expected Response: 200 OK with array of expenses
```

**Expected Response:**
```json
[
  {
    "id": 1,
    "title": "Grocery",
    "description": "Chicken",
    "category": "Food & Dining",
    "date": "2025-07-05",
    "amount": 10000
  },
  {
    "id": 2,
    "title": "Dining",
    "description": "For food",
    "category": "Food & Dining",
    "date": "2025-07-05",
    "amount": 15000
  }
]
```

### **2. POST Create New Expense**
```
Method: POST
URL: http://localhost:8080/api/expense
Headers: 
  Content-Type: application/json
Body (Raw JSON):
```

```json
{
  "title": "Movie Tickets",
  "description": "Watching Avengers Endgame",
  "category": "Entertainment",
  "date": "2024-01-15",
  "amount": 500
}
```

**Expected Response:**
```json
{
  "id": 6,
  "title": "Movie Tickets",
  "description": "Watching Avengers Endgame",
  "category": "Entertainment",
  "date": "2024-01-15",
  "amount": 500
}
```

### **3. GET Expense by ID**
```
Method: GET
URL: http://localhost:8080/api/expense/1
Headers: None required
Expected Response: 200 OK with single expense
```

### **4. PUT Update Expense**
```
Method: PUT
URL: http://localhost:8080/api/expense/1
Headers: 
  Content-Type: application/json
Body (Raw JSON):
```

```json
{
  "title": "Updated Grocery Shopping",
  "description": "Monthly groceries from Costco",
  "category": "Food & Dining",
  "date": "2024-01-20",
  "amount": 12000
}
```

### **5. DELETE Expense**
```
Method: DELETE
URL: http://localhost:8080/api/expense/6
Headers: None required
Expected Response: 200 OK
```

---

## 💰 **INCOME ENDPOINTS**

### **6. GET All Incomes**
```
Method: GET
URL: http://localhost:8080/api/income/all
Headers: None required
Expected Response: 200 OK with array of incomes
```

### **7. POST Create New Income**
```
Method: POST
URL: http://localhost:8080/api/income
Headers: 
  Content-Type: application/json
Body (Raw JSON):
```

```json
{
  "title": "Salary",
  "description": "Monthly salary payment",
  "category": "Employment",
  "date": "2024-01-15",
  "amount": 50000
}
```

### **8. GET Income by ID**
```
Method: GET
URL: http://localhost:8080/api/income/1
Headers: None required
Expected Response: 200 OK with single income
```

### **9. PUT Update Income**
```
Method: PUT
URL: http://localhost:8080/api/income/1
Headers: 
  Content-Type: application/json
Body (Raw JSON):
```

```json
{
  "title": "Updated Salary",
  "description": "Monthly salary with bonus",
  "category": "Employment",
  "date": "2024-01-20",
  "amount": 55000
}
```

### **10. DELETE Income**
```
Method: DELETE
URL: http://localhost:8080/api/income/1
Headers: None required
Expected Response: 200 OK with message
```

---

## 📊 **STATISTICS ENDPOINTS**

### **11. GET Statistics Summary**
```
Method: GET
URL: http://localhost:8080/api/stats/summary
Headers: None required
Expected Response: 200 OK with stats object
```

**Expected Response:**
```json
{
  "totalIncome": 50000,
  "totalExpense": 36050,
  "balance": 13950,
  "recentIncomes": [...],
  "recentExpenses": [...]
}
```

### **12. GET Chart Data**
```
Method: GET
URL: http://localhost:8080/api/stats/chart
Headers: None required
Expected Response: 200 OK with chart data
```

**Expected Response:**
```json
{
  "expenseData": [...],
  "incomeData": [...],
  "categoryData": [...]
}
```

---

## 🎯 **Testing Scenarios**

### **Scenario 1: Complete CRUD Operations**
1. **Create** → POST `/api/expense`
2. **Read** → GET `/api/expense/all` and GET `/api/expense/{id}`
3. **Update** → PUT `/api/expense/{id}`
4. **Delete** → DELETE `/api/expense/{id}`

### **Scenario 2: Error Handling**
1. **GET non-existent expense** → `GET /api/expense/999`
   - Expected: 404 Not Found
2. **POST invalid data** → `POST /api/expense` with missing fields
   - Expected: 400 Bad Request
3. **PUT non-existent expense** → `PUT /api/expense/999`
   - Expected: 404 Not Found

### **Scenario 3: Statistics Testing**
1. **Create multiple expenses and incomes**
2. **Check summary** → `GET /api/stats/summary`
3. **Check chart data** → `GET /api/stats/chart`

---

## 📝 **Postman Collection Setup**

### **Create Request Steps:**
1. Click **"Add request"** in your collection
2. Select **HTTP method** (GET, POST, PUT, DELETE)
3. Enter **URL** with base URL
4. Add **headers** if needed
5. Add **body** for POST/PUT requests
6. Click **"Send"**
7. Verify **response status** and **body**

### **Save Responses:**
1. Click **"Save response"** after each request
2. Add **test scripts** to validate responses
3. Use **environment variables** for dynamic values

---

## ✅ **Success Criteria**

### **All endpoints should return:**
- ✅ **200 OK** for successful operations
- ✅ **201 Created** for new resources
- ✅ **404 Not Found** for non-existent resources
- ✅ **400 Bad Request** for invalid data
- ✅ **500 Internal Server Error** for server issues

### **Response validation:**
- ✅ **JSON format** for all responses
- ✅ **Correct data types** (numbers, strings, dates)
- ✅ **Required fields** present
- ✅ **Proper error messages** for failures

---

## 🎉 **Demo Flow**

1. **Start with GET requests** to see existing data
2. **Create new records** with POST requests
3. **Update records** with PUT requests
4. **Delete records** with DELETE requests
5. **Check statistics** to see aggregated data
6. **Test error scenarios** for robustness

This comprehensive testing will demonstrate that your full-stack expense tracker application is working correctly! 🚀 