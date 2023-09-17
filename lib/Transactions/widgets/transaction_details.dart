import 'package:flutter/material.dart';

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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                width: double.infinity,
                height: 300,
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
                          fontWeight: FontWeight.w900,
                          color: Colors.red),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      purpose,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Raleway-VariableFont_wght'),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      subcategory,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Raleway-VariableFont_wght'),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      '12-09-2023',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Raleway-VariableFont_wght'),
                    ),
                    SizedBox(height: 20,),
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
            
          ],
        ),
      )),
    );
  }
}
