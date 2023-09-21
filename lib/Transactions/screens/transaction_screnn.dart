import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Transactions/widgets/add_transactio.dart';
import 'package:money_manager/Transactions/widgets/all_transaction.dart';
import 'package:money_manager/Transactions/widgets/expense_transactions.dart';
import 'package:money_manager/Transactions/widgets/filter_sheet.dart';
import 'package:money_manager/Transactions/widgets/income_transactions.dart';
import 'package:money_manager/Transactions/widgets/sort_sheet.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the TabController to prevent memory leaks
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   onPressed: () {},
      //   child: FaIcon(FontAwesomeIcons.plus),
      // ),
      backgroundColor: Color.fromARGB(255, 232, 235, 235),
      appBar: AppBar(
        title: Text(
          'Transactions',
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
      body: Stack(
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
                      text: 'All',
                    ),
                    Tab(
                      text: 'Income',
                    ),
                    Tab(
                      text: 'Expense',
                    ),
                  ]),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  AllTransactions(),
                  IncomeTransactions(),
                  ExpenseTransaction(),
                ]),
              )
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: CircleAvatar(
              minRadius: 30,
              backgroundColor: Colors.black,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return AddTransactions();
                    }));
                  },
                  icon: FaIcon(FontAwesomeIcons.plus)),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      ShowSortSheet(context);
                    },
                    icon: FaIcon(FontAwesomeIcons.sort),
                    label: Text('Sort')),
                ElevatedButton.icon(
                    onPressed: () {
                      
                      ShowFilterSheet(context);
                    },
                    icon: FaIcon(FontAwesomeIcons.filter),
                    label: Text('Filter'))
              ],
            ),
          )
        ],
      ),
    );
  }

 

  
}
