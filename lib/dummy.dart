import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
            children: [
              Column(
                    children: [
              Container(
                width: double.infinity,
                height: 350,
                color: Colors.green,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text('Hello$index');
                  },
                  itemCount: 1000,
                ),
              ),
              Container(
                width: double.infinity,
                height: 350,
                color: const Color.fromARGB(255, 175, 175, 76),
              ),
              Container(
                width: double.infinity,
                height: 750,
                color: Colors.green,
              ),
                    ],
                  ),
            ],
          )),
    );
  }
}
