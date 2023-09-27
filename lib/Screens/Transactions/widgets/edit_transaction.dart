import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/db/transactions/transaction_db.dart';
import 'package:money_manager/models/category_model.dart';
import 'package:money_manager/models/transactions_model.dart';

class EditTransaction extends StatefulWidget {
  final String purpose;
  final String amount;
  final DateTime date;
  final CategoryType category;
  final String id;
  final String subType;
  final String image;
  final int dateSum;

  const EditTransaction({super.key, required this.purpose,required this.amount,required this.date,required this.category,required this.id,required this.subType,required this.dateSum,this.image=''});
  
  
  

  @override
  State<EditTransaction> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<EditTransaction> {
  bool isDateVisible = false;
  bool isCategoryVisible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _purposeController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  late var _selectedImage;
  late final DateTime _finalDate;
  String? _finalImage;
  DateTime? _selectedDate;
  String? finalDate;
  CategoryType? _selectedCategory;
  String? selectedDropownValue;
  @override
  void initState() {
    // TODO: implement initState

    _selectedCategory = widget.category;
    _purposeController.text=widget.purpose;
    _amountController.text=widget.amount;
    _selectedDate=widget.date;
    selectedDropownValue=widget.subType;
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
          'Add Transactions',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),

              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //Purpose field

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            controller: _purposeController,
                            decoration: const InputDecoration(
                              label: Text(
                                'Purpose',
                                style: TextStyle(
                                    fontFamily: 'Raleway-VariableFont_wght',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (!RegExp(r'^\S+(?!\d+$)')
                                  .hasMatch(value ?? '')) {
                                return 'Please enter a valid purpose.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),

                      //Amount Field

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                              controller: _amountController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              decoration: const InputDecoration(
                                label: Text('Amount',
                                    style: TextStyle(
                                        fontFamily: 'Raleway-VariableFont_wght',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (!RegExp(r'^\d+\S*$')
                                    .hasMatch(value ?? '')) {
                                  return 'Please enter a valid amount.';
                                }
                                return null;
                              }),
                        ),
                      ),
                    ],
                  )),

              //Date Picker

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: ElevatedButton.icon(
                        onPressed: () async {
                          final tempDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 30)),
                              lastDate: DateTime.now());
                          setState(() {
                            _selectedDate = tempDate;
                          });
                        },
                        icon: const FaIcon(FontAwesomeIcons.calendar),
                        label: Text(_selectedDate.toString().substring(0, 10))),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      visible: isDateVisible,
                      child: Text(
                        'Please Pick a Date',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'texgyreadventor-regular',
                            color: Colors.red),
                      )),
                ],
              ),

              //Receipt image

              const Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Text(
                  'Receipt (optional)',
                  style: TextStyle(
                      fontSize: 25, fontFamily: 'texgyreadventor-regular'),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 99, 186, 17), //background color
                        foregroundColor: const Color.fromARGB(
                            255, 255, 255, 255), //ripple color
                      ),
                      onPressed: () {
                        PickImageFromCamera();
                      },
                      icon: const FaIcon(FontAwesomeIcons.camera),
                      label: const Text('Pick From Camera')),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 195, 195, 30), //background color
                        foregroundColor: const Color.fromARGB(
                            255, 255, 255, 255), //ripple color
                      ),
                      onPressed: () {
                        PickImageFromGallery();
                      },
                      icon: const FaIcon(FontAwesomeIcons.photoFilm),
                      label: const Text('Pick From Gallery')),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.grey,
                  child: _finalImage==null?
                  widget.image == ''
                      ? const Center(
                          child: Text(
                            'No Image\nSelected',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'texgyreadventor-regular'),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Image.file(
                          File(widget.image),
                          fit: BoxFit.cover,
                        ):Image.file(
                          File(_finalImage!),
                          fit: BoxFit.cover,
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
                          value: CategoryType.income,
                          groupValue: _selectedCategory,
                          onChanged: (val) {
                            setState(() {
                              _selectedCategory = CategoryType.income;
                              selectedDropownValue = null;
                            });
                          }),
                      const Text('Income',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'texgyreadventor-regular'))
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: CategoryType.expense,
                          groupValue: _selectedCategory,
                          onChanged: (val) {
                            setState(() {
                              _selectedCategory = CategoryType.expense;
                              selectedDropownValue = null;
                            });
                          }),
                      const Text('Expense',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'texgyreadventor-regular'))
                    ],
                  ),
                ],
              ),

              //Select Category

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      hint: Text(
                        'Select Category',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'texgyreadventor-regular'),
                      ),
                      value: selectedDropownValue,
                      items: (_selectedCategory == CategoryType.income
                              ? CategoryDb().incomeCategoryList
                              : CategoryDb().expenseCategoryList)
                          .value
                          .map((e) {
                        return DropdownMenuItem(
                            enabled: !e.isDeleted,
                            value: e.categoryName,
                            child: e.isDeleted != true
                                ? Text(e.categoryName,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'texgyreadventor-regular'))
                                : Text(
                                    e.categoryName,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontFamily: 'texgyreadventor-regular'),
                                  ));
                      }).toList(),
                      onChanged: (selectedValue) {
                        setState(() {
                          selectedDropownValue = selectedValue;
                        });
                      }),
                ],
              ),
              Visibility(
                  visible: isCategoryVisible,
                  child: Text(
                    'Please Pick a Category',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'texgyreadventor-regular',
                        color: Colors.red),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (selectedDropownValue == null) {
                          setState(() {
                            isCategoryVisible = true;
                          });
                        }
                        if (_selectedDate == null) {
                          setState(() {
                            isDateVisible = true;
                          });
                        }
                        if (_formKey.currentState!.validate() &&
                            _selectedDate != null &&
                            selectedDropownValue != null) {
                          await onAdd();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Updated Successfully',style: TextStyle(fontSize: 15),),behavior: SnackBarBehavior.floating,padding: EdgeInsets.all(20),));
                          Navigator.of(context).pop();
                        }
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

  // ignore: non_constant_identifier_names
  Future<void> PickImageFromGallery() async {
    _selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_selectedImage != null) {
      String imageFile = _selectedImage.path;
      setState(() {
        _finalImage = imageFile;
      });
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> PickImageFromCamera() async {
    _selectedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (_selectedImage != null) {
      String imageFile = _selectedImage.path;
      setState(() {
        _finalImage = imageFile;
      });
    }
  }

  Future<void> onAdd() async {
    String retImage;
    if (_selectedDate != null) {
      _finalDate = _selectedDate!;
    }
    if (_finalImage == null) {
      retImage=widget.image;
    }else{
      retImage=_finalImage!;
    }
    final transactionData = TransactionModel(
        id: widget.id,
        purpose: _purposeController.text,
        amount: _amountController.text,
        date: _finalDate,
        dateSum: widget.dateSum,
        recieptImage: retImage,
        type: _selectedCategory!,
        categorySubType: selectedDropownValue!);
    TransactionDb().addTransactions(transactionData);
  }
}
