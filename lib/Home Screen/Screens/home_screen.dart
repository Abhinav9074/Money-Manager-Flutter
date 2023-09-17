import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Home%20Screen/widgets/app_bar.dart';
import 'package:money_manager/Home%20Screen/widgets/drawer_items.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 235, 235),
      appBar: HomeAppBar(),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   onPressed: () {
      //     _scrollController.animateTo(0.0,
      //         duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      //   },
      //   child: FaIcon(FontAwesomeIcons.arrowUp),
      // ),
      drawer: SafeArea(
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
                  padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        '₹ 12,356.50',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 40,fontFamily:'texgyreadventor-regular',),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Total Balance',
                        style: TextStyle(
                            fontFamily: 'texgyreadventor-regular',
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                      SizedBox(
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
                            child: Container(
                              width: 210,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 53, 198, 140)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(18, 0, 0, 0),
                                    child: Text(
                                      '₹ 15123.50',
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
                          PhysicalModel(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40),
                            elevation: 8.0,
                            child: Container(
                              width: 210,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 178, 83, 83)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(18, 0, 0, 0),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 25, 0, 10),
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
                        child: ListView.separated(
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Slidable(
                                key: Key('$index'),
                                startActionPane: ActionPane(
                                    motion: BehindMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (ctx) {},
                                        icon: FontAwesomeIcons.trash,
                                        autoClose: true,
                                        backgroundColor: Colors.red,
                                        label: 'Delete',
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                    ]),
                                endActionPane: ActionPane(
                                    motion: BehindMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (ctx) {},
                                        icon: FontAwesomeIcons.penToSquare,
                                        autoClose: true,
                                        padding:
                                            EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    2,
                                                                    39,
                                                                    71))),
                                                    Text('Sept',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'texgyreadventor-regular',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    2,
                                                                    39,
                                                                    71)))
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
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: 10),
                      ),
                      SizedBox(
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
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    icon: FaIcon(FontAwesomeIcons.arrowUp)),
              ))
        ],
      ),
    );
  }
}
