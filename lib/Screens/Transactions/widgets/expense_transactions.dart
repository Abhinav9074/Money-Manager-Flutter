import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/Screens/Transactions/widgets/edit_transaction.dart';
import 'package:money_manager/Screens/Transactions/widgets/transaction_details.dart';
import 'package:money_manager/db/transactions/transaction_db.dart';
import 'package:money_manager/models/category_model.dart';
import 'package:money_manager/models/transactions_model.dart';

class ExpenseTransaction extends StatelessWidget {
  const ExpenseTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: TransactionDb().expenseTransactionsList,
            builder: (BuildContext contex, List<TransactionModel> newList,
                Widget? _) {
              return SlidableAutoCloseBehavior(
                child: ListView.builder(
                  itemCount: newList.length,
                  itemBuilder: (context, index) {
                    final data = newList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                          return TransactionDetailsScreen(price: data.amount, purpose: data.purpose, subcategory: data.categorySubType,date: data.date,image: data.recieptImage!,category: data.type,id: data.id,);
                        }));
                      },
                      child: Column(
                        children: [
                          Slidable(
                            key: Key('$index'),
                            startActionPane: ActionPane(
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (ctx) {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) {
                                            return AlertDialog(
                                              content: const Text(
                                                  'The Data Will Be Deleted'),
                                              title: const Text('Are You Sure'),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        icon:
                                                            const Icon(Icons.close)),
                                                    IconButton(
                                                      onPressed: () async {
                                                        TransactionDb()
                                                            .deleteTransaction(
                                                                data.id);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                          content: Text(
                                                            'Deleted Successfully',
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20),
                                                        ));
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: const Icon(Icons.check),
                                                    )
                                                  ],
                                                )
                                              ],
                                            );
                                          });
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
                                        return EditTransaction(
                                          purpose: data.purpose,
                                          amount: data.amount,
                                          date: data.date,
                                          category: data.type,
                                          id: data.id,
                                          subType: data.categorySubType,
                                          dateSum: data.dateSum,
                                          image: data.recieptImage!,
                                        );
                                      }));
                                    },
                                    icon: FontAwesomeIcons.penToSquare,
                                    autoClose: true,
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                    borderRadius: BorderRadius.circular(10),
                                    backgroundColor: Colors.blue,
                                    label: 'Edit',
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  parseDate(data.date),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontFamily:
                                                          'texgyreadventor-regular',
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color.fromARGB(
                                                          255, 2, 39, 71)),
                                                ),
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
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'texgyreadventor-regular',
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Color.fromARGB(
                                                              255, 33, 165, 6)))
                                                  : Text(data.categorySubType,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'texgyreadventor-regular',
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Color.fromARGB(
                                                              255, 255, 0, 0))),
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
                ),
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
    final date0 = DateFormat.MMMd().format(date);
    final splitDate = date0.split(' ');
    return '${splitDate[1]}\n${splitDate[0]}';
  }
}
