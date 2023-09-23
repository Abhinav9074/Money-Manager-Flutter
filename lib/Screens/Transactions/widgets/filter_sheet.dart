import 'package:flutter/material.dart';
import 'package:money_manager/Screens/Transactions/widgets/filter_widget.dart';

// ignore: non_constant_identifier_names
Future<void> ShowFilterSheet(BuildContext ctx) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        
        useSafeArea: true,
        context: ctx,
        builder: (ctx) {
          return const Column(

            children: [
              FilterWidget()
            ],
          );
        });
  }