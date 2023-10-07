import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Screens/stats/models/stat_models.dart';
import 'package:money_manager/Screens/stats/widgets/expense_stat.dart';
import 'package:money_manager/Screens/stats/widgets/income_stats.dart';
import 'package:money_manager/Screens/stats/widgets/stat_filter.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/db/transactions/transaction_db.dart';

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
    
    
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    CategoryDb().refreshUI();
    TransactionDb().refreshUI();
    getExpenseChartData();
    getIncomeChartData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 232, 235, 235),
        appBar: AppBar(
          title: const Text(
            'Statistics',
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'texgyreadventor-regular',
                color: Colors.black,
                fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 235, 235),
          elevation: 0,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  TabBar(
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(
                          fontSize: 20, fontFamily: 'texgyreadventor-regular'),
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      tabs: const [
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
                        children: const [IncomeStats(), ExpenseStats()]),
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
                        icon: const FaIcon(FontAwesomeIcons.filter),
                        label: const Text('Filter')),
                        ElevatedButton.icon(
                        onPressed: () async{
                          await TransactionDb().refreshUI();
                          getExpenseChartData();
                          getIncomeChartData();
                        },
                        icon: const FaIcon(FontAwesomeIcons.xmark),
                        label: const Text('Clear')),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
