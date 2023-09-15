import 'package:flutter/material.dart';
import 'package:money_manager/Home%20Screen/widgets/app_bar.dart';
import 'package:money_manager/Home%20Screen/widgets/drawer_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 224, 227),
      appBar: HomeAppBar(),
      drawer: SafeArea(
        child: Drawer(
          child: DrawerItems(),
        ),
      ),
      body: SafeArea(
          child: SizedBox(
            width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
          child: Column(
            children: [
              Text('₹ 12,356.50',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 40),),
              SizedBox(height: 10,),
              Text('Total Balance',style: TextStyle(fontFamily:'texgyreadventor-regular',fontSize: 20,color: Colors.grey),),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 210,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 53, 198, 140)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text('Income',style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'texgyreadventor-regular'),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 210,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 178, 83, 83)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text('Expense',style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'texgyreadventor-regular'),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
