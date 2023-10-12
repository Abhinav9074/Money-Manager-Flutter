import 'dart:io';

import 'package:flutter/material.dart';
import 'package:money_manager/db/user/user_db.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  PhysicalModel(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    elevation: 8.0,
                    child: InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: ValueListenableBuilder(
                        valueListenable: userProfileNotifier,
                        builder: (BuildContext context, String picture, Widget? _) {
                          return ClipOval(
                            child: picture == ''?
                            Image.asset(
                              'assets/images/profile.png',
                              width: 50,
                            ):Image.file(File(picture),width: 50,height: 50,),
                          );
                        }
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ValueListenableBuilder(
                    valueListenable: userNameNotifier,
                    builder: (BuildContext context, String name, Widget? _) {
                      return  name == ''?
                      Text(
                        'Hi',
                        style: TextStyle(
                            fontFamily: 'Raleway-VariableFont_wght',
                            fontWeight: FontWeight.w600),
                      ):Text(
                        'Hi ${name}',
                        style: TextStyle(
                            fontFamily: 'Raleway-VariableFont_wght',
                            fontWeight: FontWeight.w600),
                      );
                    }
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 100);
}
