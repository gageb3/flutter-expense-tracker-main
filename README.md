# Flutter Expense Tracker

## File Roles & Execution Order

---

## 1. `main.dart`

- **Role:** App entry point  
- **Purpose:** Launches the Flutter app using `runApp()`  
- **Importance:** Sets the root widget (`Expenses`) so the app knows which screen to display first  

---

## 2. `expenses.dart`

- **Role:** Main home screen  
- **Purpose:** Manages the list of expenses (`_registeredExpenses`) and displays the main UI  
- **Importance:** Stateful widget that is the parent of all expense-related components. Handles opening the **Add Expense** modal  

---

## 3. `new_expense.dart`

- **Role:** Input form for adding a new expense  
- **Purpose:** Lets the user enter a title and amount for a new expense  
- **Importance:** Stateful widget that captures user input and passes new expense data back to `Expenses`  

---

## 4. `expenses_list/expenses_list.dart`

- **Role:** Scrollable list container  
- **Purpose:** Receives a list of expenses from `Expenses` and displays each using `ExpenseItem`  
- **Importance:** Separates UI for the list from the main screen. Efficiently renders long lists with `ListView.builder`  

---

## 5. `expenses_list/expense_item.dart`

- **Role:** Single expense display  
- **Purpose:** Shows one expense’s title, amount, category icon, and date inside a styled card  
- **Importance:** Reusable component for displaying any expense consistently  

---

## 6. `models/expense.dart`

- **Role:** Expense data model  
- **Purpose:** Defines the structure of an `Expense` (title, amount, date, category) and generates unique IDs  
- **Importance:** Provides a central, consistent blueprint for all expenses in the app  

---

## Summary of Flow

```text
main.dart → launches app → Expenses (home screen)
           ├─ displays ExpensesList → builds ExpenseItem for each expense
           └─ opens NewExpense modal → user adds new expense → updates _registeredExpenses
