import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/models/category_model.dart';

class CategoryEditScreen extends StatefulWidget {
  final String categoryName;
  final CategoryType categoryType;
  final String CategoryId;

  const CategoryEditScreen({super.key, required this.categoryName, required this.categoryType, required this.CategoryId});

  

  @override
  State<CategoryEditScreen> createState() => _CategoryEditScreenState();
}

class _CategoryEditScreenState extends State<CategoryEditScreen> {
  final TextEditingController _nameCont = TextEditingController();
  late  CategoryType _selectedCategory;

  @override
  void initState() {
    // TODO: implement initState
    _selectedCategory = widget.categoryType;
    _nameCont.text=widget.categoryName;
    super.initState();
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

              const SizedBox(
                height: 20,
              ),

              //Category selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: CategoryType.income,
                          groupValue: _selectedCategory,
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = CategoryType.income;
                            });
                          }),
                      const Text(
                        'Income',
                        style: TextStyle(
                            fontFamily: 'Raleway-VariableFont_wght',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: CategoryType.expense,
                          groupValue: _selectedCategory,
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = CategoryType.expense;
                            });
                          }),
                      const Text(
                        'Expense',
                        style: TextStyle(
                            fontFamily: 'Raleway-VariableFont_wght',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async{
                        await onUpdate();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Updated')));
                      },
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
  Future<void>onUpdate()async{
    final updateCategory = await CategoryModel(id: widget.CategoryId, categoryName: _nameCont.text, type: _selectedCategory);
    await CategoryDb().insertCategory(updateCategory);
  }
}