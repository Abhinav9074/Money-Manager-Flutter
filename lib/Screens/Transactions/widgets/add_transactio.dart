import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddTransactions extends StatefulWidget {
  const AddTransactions({super.key});

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  List<DropdownMenuItem<Object>>? dropList;
  // ignore: prefer_typing_uninitialized_variables
  late var _selectedImage;
  File? _finalImage;
  DateTime? _selectedDate;
  String? finalDate;
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
                  ),
                ),
              ),

              //Amount Field

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(),
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
                  ),
                ),
              ),

              //Date Picker

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: ElevatedButton.icon(
                    onPressed: () async {
                      final tempDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:
                              DateTime.now().subtract(const Duration(days: 30)),
                          lastDate: DateTime.now());
                      setState(() {
                        _selectedDate = tempDate;
                        finalDate = _selectedDate.toString();
                      });
                    },
                    icon: const FaIcon(FontAwesomeIcons.calendar),
                    label: _selectedDate == null
                        ? const Text('Select Date')
                        : Text(finalDate!.substring(0, 10))),
              ),

              //Receipt image

              const Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Text(
                  'Receipt (optional)',
                  style: TextStyle(
                      fontSize: 20, fontFamily: 'texgyreadventor-regular'),
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
                  child: _finalImage == null
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
                          _finalImage!,
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
              //Select Category

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Select Category',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'texgyreadventor-regular')),
                  DropdownButton(items: dropList, onChanged: (string) {}),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, child: const Text('Add',
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
      File imageFile = File(_selectedImage.path);
      setState(() {
        _finalImage = imageFile;
      });
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> PickImageFromCamera() async {
    _selectedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (_selectedImage != null) {
      File imageFile = File(_selectedImage.path);
      setState(() {
        _finalImage = imageFile;
      });
    }
  }
}
