
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formater = DateFormat.yMd();

const uuid = Uuid();


const categoryIcons = {
  CategoryEnum.food: Icons.lunch_dining,
  CategoryEnum.travel: Icons.flight,
  CategoryEnum.leisure: Icons.movie,
  CategoryEnum.work: Icons.work,
};

enum CategoryEnum {
  food,
  travel,
  leisure,
  work
}

class Expense {
   Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;  
  final CategoryEnum category;

  String get formattedDate {
    return formater.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses
  }); 

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses
        .where((expense) => expense.category == category)
        .toList();

  final CategoryEnum category;
  final List<Expense> expenses;

  double get totalExpenses {
    double total = 0;
    for (final expense in expenses) {
      total += expense.amount;
    }
    return total;
  }
}