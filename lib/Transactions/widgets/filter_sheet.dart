import 'package:flutter/material.dart';

Future<void> ShowFilterSheet(BuildContext ctx,AnimationController _bottomSheetController) async {
    showModalBottomSheet(
      transitionAnimationController: _bottomSheetController,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        enableDrag: false,
        useSafeArea: true,
        isScrollControlled: true,
        context: ctx,
        builder: (ctx) {
          return Column(
            children: [Text('Filter')],
          );
        });
  }