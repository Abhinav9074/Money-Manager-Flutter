import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Screens/Transactions/widgets/add_transactio.dart';
import 'package:money_manager/Screens/Transactions/widgets/all_transaction.dart';
import 'package:money_manager/Screens/Transactions/widgets/expense_transactions.dart';
import 'package:money_manager/Screens/Transactions/widgets/filter_sheet.dart';
import 'package:money_manager/Screens/Transactions/widgets/income_transactions.dart';
import 'package:money_manager/Screens/Transactions/widgets/sort_sheet.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/db/transactions/transaction_db.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen>
    with TickerProviderStateMixin {
  TextEditingController searchText = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    CategoryDb().refreshUI();
    TransactionDb().refreshUI();
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
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: TextFormField(
                      controller: searchText,
                      onChanged: (val) {
                        if (val.isEmpty) {
                          TransactionDb().refreshUI();
                        } else {
                          TransactionDb().searchTransactions(val);
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text(
                            'Search Transactions',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'texgyreadventor-regular'),
                          )),
                    ),
                  )),
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
