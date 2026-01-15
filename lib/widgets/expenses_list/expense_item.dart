// Import Flutter Material library (widgets, layout, icons)
import 'package:flutter/material.dart';

// Import the Expense model (data structure for an expense)
import 'package:expense_tracker/models/expense.dart';

// ------------------------------------------------------------
// Widget that represents ONE expense in the list
// ------------------------------------------------------------
class ExpenseItem extends StatelessWidget {
  // Constructor takes an Expense object
  const ExpenseItem(this.expense, {super.key});

  // The expense to display
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card gives a Material Design look with shadow and rounded corners
      child: Padding(
        // Adds spacing inside the Card
        padding: const EdgeInsets.symmetric(
          horizontal: 20, // left/right padding
          vertical: 16,   // top/bottom padding
        ),
        child: Column(
          // Align children vertically
          crossAxisAlignment: CrossAxisAlignment.start, // left-align text
          children: [

            // Show the title of the expense (e.g., "Cinema")
            Text(expense.title),

            // Small space between title and details
            const SizedBox(height: 6),

            // Row for amount, category icon, and date
            Row(
              children: [

                // Show expense amount formatted to 2 decimal places
                Text('\$${expense.amount.toStringAsFixed(2)}'),

                // Spacer pushes the next widget to the far right of the row
                const Spacer(),

                // Row for icon + date
                Row(
                  children: [
                    // Icon representing the expense category
                    Icon(categoryIcons[expense.category]),

                    // Small space between icon and date text
                    const SizedBox(width: 8),

                    // Display the date as a string (currently raw DateTime)
                    Text(expense.date.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
