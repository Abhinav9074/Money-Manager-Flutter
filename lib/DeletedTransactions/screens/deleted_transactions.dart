import 'package:flutter/material.dart';

class DeletedTransactions extends StatelessWidget {
  const DeletedTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Text('Deleted transactions')),
    );
  }
}