import 'package:flutter/material.dart';

class ExpenseStats extends StatelessWidget {
  const ExpenseStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Expense Stats')
      ],
    );
  }
}