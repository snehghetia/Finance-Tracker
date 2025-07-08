# Expense Tracker Frontend

A modern React TypeScript frontend for the Expense Tracker application. This frontend provides a beautiful and intuitive user interface for managing personal finances.

## Features

- 📊 **Dashboard**: Overview of financial summary with recent transactions
- 💰 **Expense Management**: Add, edit, and delete expenses with categories
- 💵 **Income Management**: Track income sources and amounts
- 📈 **Analytics**: Visual charts and statistics for financial insights
- 🎨 **Modern UI**: Clean, responsive design with Tailwind CSS
- 📱 **Mobile Friendly**: Responsive design that works on all devices

## Tech Stack

- **React 18** with TypeScript
- **React Router** for navigation
- **Tailwind CSS** for styling
- **Chart.js** with react-chartjs-2 for data visualization
- **React Hook Form** for form handling
- **Axios** for API communication
- **Lucide React** for icons
- **React Hot Toast** for notifications

## Getting Started

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- Backend server running on `http://localhost:8080`

### Installation

1. Install dependencies:
```bash
npm install
```

2. Start the development server:
```bash
npm start
```

3. Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

### Building for Production

```bash
npm run build
```

## Project Structure

```
src/
├── components/          # React components
│   ├── Layout.tsx      # Main layout with navigation
│   ├── Dashboard.tsx   # Dashboard overview
│   ├── ExpenseList.tsx # Expense management
│   ├── ExpenseForm.tsx # Expense form
│   ├── IncomeList.tsx  # Income management
│   ├── IncomeForm.tsx  # Income form
│   └── Analytics.tsx   # Charts and statistics
├── services/           # API services
│   └── api.ts         # API communication layer
├── types/              # TypeScript type definitions
│   └── index.ts       # Application types
├── App.tsx            # Main application component
├── index.tsx          # Application entry point
└── index.css          # Global styles with Tailwind
```

## API Integration

The frontend communicates with the Spring Boot backend through the following endpoints:

### Expenses
- `GET /api/expense/all` - Get all expenses
- `POST /api/expense` - Create new expense
- `PUT /api/expense/{id}` - Update expense
- `DELETE /api/expense/{id}` - Delete expense

### Income
- `GET /api/income/all` - Get all income
- `POST /api/income` - Create new income
- `PUT /api/income/{id}` - Update income
- `DELETE /api/income/{id}` - Delete income

### Analytics
- `GET /api/stats/summary` - Get financial summary
- `GET /api/stats/chart` - Get chart data

## Features Overview

### Dashboard
- Financial summary cards (Income, Expenses, Balance)
- Recent transactions display
- Quick overview of financial health

### Expense Management
- Add new expenses with categories
- Edit existing expenses
- Delete expenses with confirmation
- Categorized expense tracking
- Date-based organization

### Income Management
- Add new income sources
- Edit existing income entries
- Delete income records
- Income categorization
- Date tracking

### Analytics
- Visual charts using Chart.js
- Income vs Expenses comparison
- Category breakdowns
- Financial statistics
- Interactive data visualization

## Styling

The application uses Tailwind CSS for styling with a custom color scheme:

- **Primary**: Blue shades for main actions
- **Success**: Green shades for income and positive values
- **Danger**: Red shades for expenses and negative values
- **Gray**: Neutral colors for text and backgrounds

## Responsive Design

The application is fully responsive and works on:
- Desktop computers
- Tablets
- Mobile phones

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Development

### Available Scripts

- `npm start` - Runs the app in development mode
- `npm test` - Launches the test runner
- `npm run build` - Builds the app for production
- `npm run eject` - Ejects from Create React App (not recommended)

### Code Style

- TypeScript for type safety
- Functional components with hooks
- Consistent naming conventions
- Proper error handling
- Loading states for better UX

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License. 