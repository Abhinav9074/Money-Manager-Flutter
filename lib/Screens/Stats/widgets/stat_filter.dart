import 'package:flutter/material.dart';
import 'package:money_manager/Screens/Stats/widgets/stat_filter_widget.dart';

// ignore: non_constant_identifier_names
Future<void> ShowStatFilterSheet(BuildContext ctx) async {
  await showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatFilterWidget()
              ],
            )
          ],
        );
      });
}