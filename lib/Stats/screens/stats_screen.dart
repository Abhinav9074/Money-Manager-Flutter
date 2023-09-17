import 'package:flutter/material.dart';
import 'package:money_manager/Stats/widgets/expense_stat.dart';
import 'package:money_manager/Stats/widgets/income_stats.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 235, 235),
        appBar: AppBar(
          title: Text(
            'Statistics',
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'texgyreadventor-regular',
                color: Colors.black,
                fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 232, 235, 235),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                  labelColor: Colors.black,
                  labelStyle: TextStyle(
                      fontSize: 20, fontFamily: 'texgyreadventor-regular'),
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: 'Income',
                    ),
                    Tab(
                      text: 'Expense',
                    )
                  ]),
              Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: [
                    IncomeStats(),
                    ExpenseStats()
                    ]
                    ),
              )
            ],
          ),
        ));
  }
}
