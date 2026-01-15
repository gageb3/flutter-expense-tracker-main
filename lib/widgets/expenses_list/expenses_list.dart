// Import the widget that displays a single expense
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

// Flutter Material library (needed for ListView, StatelessWidget, etc.)
import 'package:flutter/material.dart';

// Import the Expense model
import 'package:expense_tracker/models/expense.dart';

// ------------------------------------------------------------
// Widget that displays a scrollable list of expenses
// ------------------------------------------------------------
class ExpensesList extends StatelessWidget {
  // Constructor takes a list of Expense objects
  const ExpensesList({super.key, required this.expenses});

  // List of expenses to display, passed from the parent (Expenses)
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // ListView.builder creates a scrollable list efficiently
    // Only the visible items are built
    return ListView.builder(
      // Number of items in the list
      itemCount: expenses.length,

      // Builds each item on demand
      itemBuilder: (ctx, index) =>
          // For each expense, create an ExpenseItem widget
          ExpenseItem(expenses[index]),
    );
  }
}
