import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Transactions/widgets/edit_transaction.dart';

class TransactionDetails extends StatelessWidget {
  final int price;
  final String purpose;
  final String subcategory;

  const TransactionDetails(
      {super.key,
      required this.price,
      required this.purpose,
      required this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
            )),
        backgroundColor: Color.fromARGB(255, 232, 235, 235),
        elevation: 0,
        title: Text('Transaction Details',
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'texgyreadventor-regular',
                color: Colors.black,
                fontWeight: FontWeight.w900)),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 232, 235, 235),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 4, 37, 112),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹$price.00',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                        fontFamily: 'texgyreadventor-regular',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      purpose,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Raleway-VariableFont_wght'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      subcategory,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Raleway-VariableFont_wght'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '12-09-2023',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Raleway-VariableFont_wght'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '12:34 PM',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Raleway-VariableFont_wght'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.image),
                        label: Text('View Receipt'))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Other Expenses In $subcategory',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'texgyreadventor-regular',
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 2, 39, 71)),
              ),
            ),
            Expanded(
                child: SlidableAutoCloseBehavior(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
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
                            child: Slidable(
                              key: Key('$index'),
                              startActionPane:
                                  ActionPane(motion: BehindMotion(), children: [
                                SlidableAction(
                                  onPressed: (ctx) {},
                                  icon: FontAwesomeIcons.trash,
                                  autoClose: true,
                                  backgroundColor: Colors.red,
                                  label: 'Delete',
                                  borderRadius: BorderRadius.circular(10),
                                )
                              ]),
                              endActionPane:
                                  ActionPane(motion: BehindMotion(), children: [
                                SlidableAction(
                                  onPressed: (ctx) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (ctx) {
                                      return EditTransaction();
                                    }));
                                  },
                                  icon: FontAwesomeIcons.penToSquare,
                                  autoClose: true,
                                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                                                  color: Color.fromARGB(
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
                                                  Text('${index + 10}',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'texgyreadventor-regular',
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Color.fromARGB(
                                                              255, 2, 39, 71))),
                                                  Text('Sept',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'texgyreadventor-regular',
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Color.fromARGB(
                                                              255, 2, 39, 71)))
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Lunch${index + 1}',
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontFamily:
                                                            'texgyreadventor-regular',
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Color.fromARGB(
                                                            255, 2, 39, 71))),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text('Food',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily:
                                                            'texgyreadventor-regular',
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Color.fromARGB(
                                                            255,
                                                            149,
                                                            151,
                                                            152))),
                                              ],
                                            ),
                                          ),
                                          Text('₹112.00',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontFamily:
                                                      'texgyreadventor-regular',
                                                  fontWeight: FontWeight.w600,
                                                  color: index % 2 == 0
                                                      ? Colors.green
                                                      : Colors.red)),
                                          SizedBox(
                                            width: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: 10)))
          ],
        ),
      )),
    );
  }
}
