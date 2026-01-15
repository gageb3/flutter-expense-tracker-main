import 'package:flutter/material.dart'; // Needed for Icons
import 'package:uuid/uuid.dart';         // Generates unique IDs
import 'package:intl/intl.dart';          // Date formatting utilities

// ------------------------------------------------------------
// Formatter used to convert DateTime into a readable string
// Example output: 9/18/2026
// ------------------------------------------------------------
final formatter = DateFormat.yMd();

// ------------------------------------------------------------
// UUID generator instance
// 'const' because the Uuid object itself is immutable
// ------------------------------------------------------------
const uuid = Uuid();

// ------------------------------------------------------------
// Enum = a fixed set of allowed values
// This ensures category is always one of these options
// ------------------------------------------------------------
enum Category {
  food,
  travel,
  leisure,
  work
}

// ------------------------------------------------------------
// Maps each category to a Material icon
// Keeps UI logic consistent and centralized
// ------------------------------------------------------------
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

// ------------------------------------------------------------
// Expense model — describes what an expense "is"
// ------------------------------------------------------------
class Expense {

  // Constructor with named parameters
  // All fields are required when creating an Expense
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) 
  // Assign a unique ID automatically when the object is created
  : id = uuid.v4();

  // ----------------------------------------------------------
  // Fields (all final → Expense objects are immutable)
  // ----------------------------------------------------------
  final String id;         // Unique identifier (used for lists, deletion)
  final String title;      // Expense title (e.g. "Lunch")
  final double amount;     // Cost of the expense
  final DateTime date;     // When the expense occurred
  final Category category;// Expense category

  // ----------------------------------------------------------
  // Getter that returns a formatted date string
  // Called like: expense.formattedDate
  // ----------------------------------------------------------
  String get formattedDate {
    return formatter.format(date);
  }
}
