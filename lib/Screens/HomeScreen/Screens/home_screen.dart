import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/Screens/HomeScreen/widgets/app_bar.dart';
import 'package:money_manager/Screens/HomeScreen/widgets/drawer_items.dart';
import 'package:money_manager/Screens/Stats/widgets/income_stats.dart';
import 'package:money_manager/db/transactions/transaction_db.dart';
import 'package:money_manager/models/category_model.dart';
import 'package:money_manager/models/transactions_model.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var size, height, width;
  final ScrollController _scrollController = ScrollController();
  
  @override
  void initState() {
    // TODO: implement initState
    TransactionDb().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 235, 235),
      appBar: const HomeAppBar(),
      drawer: const SafeArea(
        child: Drawer(
          child: DrawerItems(),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
              child: ListView(
            controller: _scrollController,
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Column(
                    children: [
                      const Text(
                        '₹ 12,356.50',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                          fontFamily: 'texgyreadventor-regular',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Total Balance',
                        style: TextStyle(
                            fontFamily: 'texgyreadventor-regular',
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PhysicalModel(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40),
                            elevation: 8.0,
                            child: InkWell(
                              onLongPress: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return const IncomeStats();
                                    });
                              },
                              child: Container(
                                width: width / 2.2,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(
                                        255, 53, 198, 140)),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(18.0),
                                      child: Text(
                                        'Income',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontFamily:
                                                'texgyreadventor-regular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                                      child: Text(
                                        '₹ 15123.50',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontFamily:
                                                'texgyreadventor-regular',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          PhysicalModel(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40),
                            elevation: 8.0,
                            child: Container(
                              width: width / 2.2,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(255, 178, 83, 83)),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: Text(
                                      'Expense',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily:
                                              'texgyreadventor-regular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                                    child: Text(
                                      '₹ 2345.50',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: 'texgyreadventor-regular',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(30, 25, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Recent Transactions',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'texgyreadventor-regular',
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(255, 2, 39, 71)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 700,
                        child: ValueListenableBuilder(
                          valueListenable: TransactionDb().allTransactionsList,
                          builder: (BuildContext context,
                              List<TransactionModel> newList, Widget? _) {
                            return ListView.separated(
                                controller: _scrollController,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final data = newList[index];
                                  return InkWell(
                                    // onTap: () {
                                    //   Navigator.of(context)
                                    //       .push(MaterialPageRoute(builder: (ctx) {
                                    //     return TransactionDetails(
                                    //         price: 112,
                                    //         purpose: 'Lunch${index + 1}',
                                    //         subcategory: 'Food');
                                    //   }));
                                    // },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 5, 20, 5),
                                      child: PhysicalModel(
                                        color: Colors.black,
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(40),
                                        elevation: 6.0,
                                        child: Container(
                                          width: double.infinity,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                PhysicalModel(
                                                  color: Colors.black,
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                  elevation: 4.0,
                                                  child: Container(
                                                    width: 70,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(255,
                                                            232, 235, 235),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          parseDate(
                                                              data.date),
                                                          textAlign:
                                                              TextAlign
                                                                  .center,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  'texgyreadventor-regular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      2,
                                                                      39,
                                                                      71)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(data.purpose,
                                                          style: const TextStyle(
                                                              fontSize: 25,
                                                              fontFamily:
                                                                  'texgyreadventor-regular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      2,
                                                                      39,
                                                                      71))),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      data
                                                                  .type ==
                                                              CategoryType
                                                                  .income
                                                          ? Text(data.categorySubType,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      18,
                                                                  fontFamily:
                                                                      'texgyreadventor-regular',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  color: Color.fromARGB(
                                                                      255,
                                                                      33,
                                                                      165,
                                                                      6)))
                                                          : Text(
                                                              data
                                                                  .categorySubType,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      18,
                                                                  fontFamily:
                                                                      'texgyreadventor-regular',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  color: Color.fromARGB(
                                                                      255,
                                                                      255,
                                                                      0,
                                                                      0))),
                                                    ],
                                                  ),
                                                ),
                                                Text('₹${data.amount}',
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        fontFamily:
                                                            'texgyreadventor-regular',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: data.type ==
                                                                CategoryType
                                                                    .income
                                                            ? Colors.green
                                                            : Colors.red)),
                                                const SizedBox(
                                                  width: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount: newList.length);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          Positioned(
              bottom: 20,
              right: 20,
              child: CircleAvatar(
                child: IconButton(
                    onPressed: () {
                      _scrollController.animateTo(0.0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    icon: const FaIcon(FontAwesomeIcons.arrowUp)),
              ))
        ],
      ),
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitDate = _date.split(' ');
    return '${_splitDate[1]}\n${_splitDate[0]}';
  }
}
