import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/custom_widgets/custom_button.dart';
import 'package:my_fashion/custom_widgets/custom_textfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? selectedGender; // Gender dropdown variable
  File? profileimage;
  final ImagePicker imagePicker = ImagePicker();

  // Function to pickImage from gallery
  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileimage = File(pickedFile.path);
      });
    }
  }

  // Function to pickImage from camera
  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        profileimage = File(pickedFile.path);
      });
    }
  }

  // Alert Dialog
  showAlertDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose image from"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Gallery"),
                  onTap: () {
                    pickImageFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Camera"),
                  onTap: () {
                    pickImageFromCamera();
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
        child: Center(
          child: Column(
            children: [
              Text(
                "Complete your profile",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                "Don't worry, only you can see your personal data. no one else will be able to see it.",
                style: TextStyle(
                  fontSize: 15,
                  color: grey,
                ),
              ),
              SizedBox(height: 20),
              // Profile image
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        profileimage != null ? FileImage(profileimage!) : null,
                    backgroundColor: grey.shade300,
                    child: profileimage == null
                        ? Icon(
                            Icons.person,
                            size: 60,
                            color: grey,
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: showAlertDialog,
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: brown,
                        child: Icon(
                          Icons.edit,
                          color: white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: "Name",
                controller: nameController,
              ),
              SizedBox(height: 20),
              // Phone number field with country code
              IntlPhoneField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: brown, fontSize: 17),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.brown, width: 2.0),
                  ),
                ),
                initialCountryCode: 'IN', // Set to India
                onChanged: (phone) {
                  print(phone.completeNumber); // Full phone number
                },
              ),
              SizedBox(height: 10),

              // Gender dropdown field
              DropdownButtonFormField<String>(
                value: selectedGender,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: brown, fontSize: 17),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.brown, width: 2.0),
                  ),
                ),
                items: ['Male', 'Female', 'Transgender'].map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(
                      gender,
                      style: TextStyle(
                        color: Colors.black, // Text color for dropdown items
                        fontWeight: FontWeight.normal, // Prevent bold style
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value; // Update the selected gender
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(text: "Complete Profile", callback: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
