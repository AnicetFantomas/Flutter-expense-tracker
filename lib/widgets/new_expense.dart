import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  var _enterdedTitle = '';

  void _saveTitleInput(String inputValue) {
    _enterdedTitle = inputValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            TextField(
                onChanged: _saveTitleInput,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Expense Title'),
                )
                ),
            Row(
              children: [
              ElevatedButton(
                  onPressed: () {print(_enterdedTitle);}, 
                  child: const Text('Save Expense'),
                  )
            ]
            )
          ],
        ));
  }
}
