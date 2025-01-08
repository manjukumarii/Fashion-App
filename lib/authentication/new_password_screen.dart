import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/custom_widgets/custom_button.dart';
import 'package:my_fashion/custom_widgets/custom_textfield.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return NewPasswordScreenState();
  }
}

class NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Center(
          child: Column(
            children: [
              Text(
                "New Password",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.center,
                "Your new password must be different from previous used passwords",
                style: TextStyle(
                  fontSize: 16,
                  color: grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: "Password",
                controller: passwordController,
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: "New Password",
                controller: newPasswordController,
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Create new password",
                callback: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
