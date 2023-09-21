import 'package:flutter/material.dart';
import 'package:money_manager/Transactions/widgets/filter_widget.dart';

Future<void> ShowFilterSheet(BuildContext ctx) async {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        
        useSafeArea: true,
        context: ctx,
        builder: (ctx) {
          return Column(

            children: [
              FilterWidget()
            ],
          );
        });
  }