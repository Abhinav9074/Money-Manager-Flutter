import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Screens/Search/search_screen.dart';
import 'package:money_manager/Screens/Transactions/widgets/add_transactio.dart';
import 'package:money_manager/Screens/Transactions/widgets/all_transaction.dart';
import 'package:money_manager/Screens/Transactions/widgets/expense_transactions.dart';
import 'package:money_manager/Screens/Transactions/widgets/filter_sheet.dart';
import 'package:money_manager/Screens/Transactions/widgets/income_transactions.dart';
import 'package:money_manager/Screens/Transactions/widgets/sort_sheet.dart';

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
      backgroundColor: const Color.fromARGB(255, 232, 235, 235),
      appBar: AppBar(
        title: const Text(
          'Transactions',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'texgyreadventor-regular',
              color: Colors.black,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 232, 235, 235),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const SearchingBar();
                  }));
                },
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: 30,
                )),
          ),
        ],
      ),
      body: Stack(
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
                child: TabBarView(controller: _tabController, children: const [
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
                      return const AddTransactions();
                    }));
                  },
                  icon: const FaIcon(FontAwesomeIcons.plus)),
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
                    icon: const FaIcon(FontAwesomeIcons.sort),
                    label: const Text('Sort')),
                ElevatedButton.icon(
                    onPressed: () {
                      ShowFilterSheet(context);
                    },
                    icon: const FaIcon(FontAwesomeIcons.filter),
                    label: const Text('Filter'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
