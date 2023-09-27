import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/models/category_model.dart';


class CategoryAddScreen extends StatefulWidget {

  CategoryAddScreen({super.key});

  @override
  State<CategoryAddScreen> createState() => _CategoryAddScreenState();
}

class _CategoryAddScreenState extends State<CategoryAddScreen> {
  final TextEditingController _nameCont = TextEditingController();
  CategoryType? _selectedCategory;

  @override
  void initState() {
    _selectedCategory=CategoryType.income;
  }

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
          'Add Category',
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
                    controller: _nameCont,
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
                      Radio(value: CategoryType.income, groupValue: _selectedCategory, onChanged: (value){
                        setState(() {
                          _selectedCategory= CategoryType.income;
                        });
                      }),
                      const Text('Income',style: TextStyle(
                            fontFamily: 'Raleway-VariableFont_wght',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),)
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: CategoryType.expense, groupValue: _selectedCategory, onChanged: (value){
                        setState(() {
                          _selectedCategory= CategoryType.expense;
                        });
                      }),
                      const Text('Expense',style: TextStyle(
                            fontFamily: 'Raleway-VariableFont_wght',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),)
                    ],
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await AddCategory(_nameCont.text);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Category Added')));
                      },
                      child: const Text('Add',
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

  Future<void> AddCategory(String name) async {
    final Data = await CategoryModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        categoryName: name,
        type: _selectedCategory!);
        await CategoryDb().insertCategory(Data);
        
  }
}
