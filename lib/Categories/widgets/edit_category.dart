import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryEditScreen extends StatelessWidget {
  const CategoryEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 235, 235),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
              )),
        ),
        title: const Text(
          'Edit Category',
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),

              //Purpose field

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text(
                        'Category Name',
                        style: TextStyle(
                            fontFamily: 'Raleway-VariableFont_wght',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              //Income or Expense Selector

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 'value1',
                          groupValue: 'Value1',
                          onChanged: (val) {}),
                      const Text('Income',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'texgyreadventor-regular'))
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'value2',
                          groupValue: 'radioValue',
                          onChanged: (val) {}),
                      const Text('Expense',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'texgyreadventor-regular'))
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Update',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'texgyreadventor-regular')))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
