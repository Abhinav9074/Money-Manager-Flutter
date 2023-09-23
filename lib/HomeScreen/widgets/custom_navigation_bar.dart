import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Categories/screens/categories_screen.dart';
import 'package:money_manager/HomeScreen/screens/home_screen.dart';
import 'package:money_manager/Settings/screens/settings_screen.dart';
import 'package:money_manager/Stats/screens/stats_screen.dart';
import 'package:money_manager/Transactions/screens/transaction_screnn.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int? currentTab;
  final List<Widget> screens = [
    const TransactionsScreen(),
    const StatsScreen(),
     HomeScreen(),
    const CategoryScreen(),
     SettingsScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen =  HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: SizedBox(
        height: 75,
        width: 75,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                currentScreen =  HomeScreen();
                currentTab = null;
              });
            },
            child: const FaIcon(FontAwesomeIcons.house),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const TransactionsScreen();
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.indianRupeeSign,
                      color: currentTab == 0 ? Colors.blue : Colors.black,
                    ),
                    Text(
                      'Transactions',
                      style: TextStyle(
                        color:
                            currentTab == 0 ? Colors.blue : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const StatsScreen();
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.chartPie,
                      color: currentTab == 1 ? Colors.blue : Colors.black,
                    ),
                    Text(
                      'Stats',
                      style: TextStyle(
                        color:
                            currentTab == 1 ? Colors.blue : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const CategoryScreen();
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.boxesStacked,
                      color: currentTab == 2 ? Colors.blue : Colors.black,
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(
                        color:
                            currentTab == 2 ? Colors.blue : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =  SettingsScreen();
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.gear,
                      color: currentTab == 3 ? Colors.blue : Colors.black,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color:
                            currentTab == 3 ? Colors.blue : Colors.black,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
