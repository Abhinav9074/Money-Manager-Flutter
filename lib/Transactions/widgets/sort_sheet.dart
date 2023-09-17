 import 'package:flutter/material.dart';

Future<void> ShowSortSheet(BuildContext ctx,AnimationController _bottomSheetController) async {
    showModalBottomSheet(
      transitionAnimationController: _bottomSheetController,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        useSafeArea: true,
        isScrollControlled: true,
        context: ctx,
        builder: (ctx) {
          return Column(
            children: [TextField()],
          );
        });
  }