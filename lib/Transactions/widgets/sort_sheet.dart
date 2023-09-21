 import 'package:flutter/material.dart';
import 'package:money_manager/Transactions/widgets/sort_widget.dart';

Future<void> ShowSortSheet(BuildContext ctx) async {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        context: ctx,
        builder: (ctx) {
          return Column(
            children: [SortWidget()],
          );
        });
  }