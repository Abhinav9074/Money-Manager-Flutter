import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Stats/widgets/expense_stat.dart';
import 'package:money_manager/Stats/widgets/income_stats.dart';
import 'package:money_manager/Stats/widgets/stat_filter.dart';

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
          child: Stack(
            children: [
              Column(
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
                        children: [IncomeStats(), ExpenseStats()]),
                  )
                ],
              ),
              Positioned(
                bottom: 40,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          ShowStatFilterSheet(context);
                        },
                        icon: FaIcon(FontAwesomeIcons.filter),
                        label: Text('Filter')),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
