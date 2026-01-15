// Import Flutter Material widgets (UI, navigation, styling)
import 'package:flutter/material.dart';

// Widget that shows a form for adding a new expense
// StatefulWidget because user input changes over time
class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

// Private State class that holds form data and logic
class _NewExpenseState extends State<NewExpense> {

  // Controllers to read text input values from TextFields
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  // Clean up controllers when the widget is removed
  // Prevents memory leaks
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // Builds the UI for the new expense form
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16), // Space around the form
      child: Column(
        children: [

          // Text input for the expense title
          TextField(
            controller: _titleController,
            maxLength: 50, // Limit title length
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),

          // Text input for the expense amount
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number, // Numeric keyboard
            decoration: const InputDecoration(
              prefixText: '\$ ',
              label: Text('Amount'),
            ),
          ),

          // Row containing Cancel and Save buttons
          Row(
            children: [

              // Cancel button closes the modal
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),

              // Save button (currently just prints values)
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
