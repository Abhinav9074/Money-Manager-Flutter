import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/Transactions/widgets/edit_transaction.dart';
import 'package:money_manager/Transactions/widgets/transaction_details.dart';

class SearchingBar extends StatelessWidget {
  const SearchingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 235, 235),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
            )),
        backgroundColor: const Color.fromARGB(255, 232, 235, 235),
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text('Enter the Purpose of Transaction'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                  label: Text('Search')),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.x),
                  label: Text('Clear')),
            ],
          ),
          Expanded(
            child: SlidableAutoCloseBehavior(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return TransactionDetails(
                              price: 112,
                              purpose: 'Lunch${index + 1}',
                              subcategory: 'Food');
                        }));
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
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    PhysicalModel(
                                      color: Colors.black,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                      elevation: 4.0,
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 232, 235, 235),
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromARGB(
                                                        255, 2, 39, 71))),
                                            Text('Sept',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily:
                                                        'texgyreadventor-regular',
                                                    fontWeight: FontWeight.w900,
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
                                                  fontWeight: FontWeight.w900,
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
                                                  fontWeight: FontWeight.w900,
                                                  color: Color.fromARGB(
                                                      255, 149, 151, 152))),
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
                  itemCount: 10),
            ),
          ),
        ],
      )),
    );
  }
}
