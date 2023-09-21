import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  File? imageData;
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
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'texgyreadventor-regular',
              color: Colors.black,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: ClipOval(
                child: imageData != null
                    ? Image.file(
                        imageData!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/images/profile.png'),
              ),
            ),
          ),
          ElevatedButton.icon(
              onPressed: () {
                AddImage();
              },
              icon: FaIcon(FontAwesomeIcons.penToSquare),
              label: Text('Add Image')),
              SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('User Name',
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
          ElevatedButton.icon(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.check), label: Text('Update'))
        ],
      ),
    );
  }

  Future<void> AddImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      File imgData = File(img.path);
      setState(() {
        imageData = imgData;
      });
    }
  }
}
