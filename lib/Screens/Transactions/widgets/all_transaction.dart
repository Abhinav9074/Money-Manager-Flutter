import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/Screens/Transactions/widgets/edit_transaction.dart';
import 'package:money_manager/Screens/Transactions/widgets/transaction_details.dart';
import 'package:money_manager/db/transactions/transaction_db.dart';
import 'package:money_manager/models/category_model.dart';
import 'package:money_manager/models/transactions_model.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: TransactionDb().allTransactionsList,
            builder: (BuildContext context, List<TransactionModel> newList,
                Widget? _) {
              return SlidableAutoCloseBehavior(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final data = newList[index];
                      return InkWell(
                        onTap: () {
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (ctx) {
                          //   return TransactionDetails(
                          //       price: 112,
                          //       purpose: 'Lunch${index + 1}',
                          //       subcategory: 'Food');
                          // }));
                        },
                        child: Column(
                          children: [
                            Slidable(
                              key: Key('$index'),
                              startActionPane: ActionPane(
                                  motion: const BehindMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (ctx) async {
                                        await TransactionDb()
                                            .deleteTransaction(data.id);
                                      },
                                      icon: FontAwesomeIcons.trash,
                                      autoClose: true,
                                      backgroundColor: Colors.red,
                                      label: 'Delete',
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                  ]),
                              endActionPane: ActionPane(
                                  motion: const BehindMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (ctx) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (ctx) {
                                          return EditTransaction(purpose: data.purpose,amount: data.amount,date: data.date,category: data.type,id: data.id,subType: data.categorySubType,dateSum: data.dateSum,image: data.recieptImage!,);
                                        }));
                                      },
                                      icon: FontAwesomeIcons.penToSquare,
                                      autoClose: true,
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 5, 20, 5),
                                      borderRadius: BorderRadius.circular(10),
                                      backgroundColor: Colors.blue,
                                      label: 'Edit',
                                    )
                                  ]),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: PhysicalModel(
                                  color: Colors.black,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(40),
                                  elevation: 6.0,
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          PhysicalModel(
                                            color: Colors.black,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            elevation: 4.0,
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 232, 235, 235),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      parseDate(data.date),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'texgyreadventor-regular',
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Color.fromARGB(
                                                              255, 2, 39, 71)),
                                                    ),
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
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(data.purpose,
                                                    style: const TextStyle(
                                                        fontSize: 25,
                                                        fontFamily:
                                                            'texgyreadventor-regular',
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Color.fromARGB(
                                                            255, 2, 39, 71))),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                data.type == CategoryType.income
                                                    ? Text(data.categorySubType,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'texgyreadventor-regular',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color:
                                                                Color.fromARGB(255, 33, 165, 6)))
                                                    : Text(data.categorySubType,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'texgyreadventor-regular',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    0,
                                                                    0)))
                                              ],
                                            ),
                                          ),
                                          Text('₹${data.amount}',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontFamily:
                                                      'texgyreadventor-regular',
                                                  fontWeight: FontWeight.w600,
                                                  color: data.type ==
                                                          CategoryType.income
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
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 5,
                      );
                    },
                    itemCount: newList.length),
              );
            },
          ),
        ),
        Container(
          color: Colors.transparent,
          height: 80,
        )
      ],
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitDate = _date.split(' ');
    return '${_splitDate[1]}\n${_splitDate[0]}';
  }
}
