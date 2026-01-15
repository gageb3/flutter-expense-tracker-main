// Import Flutter’s Material library (widgets, themes, Scaffold, etc.)
import 'package:flutter/material.dart';

// Import the Expense model (defines what an expense "is")
import 'package:expense_tracker/models/expense.dart';

// Import the widget that displays a list of expenses
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

// Import the widget used to add a new expense (modal bottom sheet)
import 'package:expense_tracker/widgets/new_expense.dart';

// ------------------------------------------------------------
// Expenses is the main screen of the app.
// It must be StatefulWidget because the list of expenses can
// change over time (add/remove).
// ------------------------------------------------------------
class Expenses extends StatefulWidget {
  // Standard const constructor; super.key forwards the key
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    // Tells Flutter which State object manages this widget
    return _ExpensesState();
  }
}

// ------------------------------------------------------------
// Private State class that holds mutable data and logic
// ------------------------------------------------------------
class _ExpensesState extends State<Expenses> {

  // List of expenses currently registered in the app.
  // This is the "source of truth" for what gets displayed.
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  // ------------------------------------------------------------
  // Opens a modal bottom sheet for adding a new expense.
  // showModalBottomSheet displays a UI that slides up
  // from the bottom of the screen.
  // ------------------------------------------------------------
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,

      // builder returns the widget that should be shown
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // build() is called whenever setState() is triggered
    return Scaffold(
      // AppBar at the top of the screen
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),

        // Action buttons displayed on the right side of the AppBar
        actions: [
          IconButton(
            // Opens the "add expense" bottom sheet
            onPressed: _openAddExpenseOverlay,

            // "+" icon
            icon: const Icon(Icons.add),
          ),
        ],
      ),

      // Body of the screen
      body: Column(
        children: [

          // Placeholder widget — will be replaced by a chart later
          const Text('The chart'),

          // Expanded forces the expense list to take up
          // all remaining vertical space
          Expanded(
            // Pass the expense list down to the ExpensesList widget
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
