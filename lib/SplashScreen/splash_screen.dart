import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_manager/Home%20Screen/widgets/custom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return CustomNavigationBar();
      }));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/loading.gif'),
            Text(
              'Money Manager',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'texgyreadventor-regular',
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }
}
