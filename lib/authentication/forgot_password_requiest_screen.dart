import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/custom_widgets/custom_button.dart';
import 'package:my_fashion/custom_widgets/custom_textfield.dart';

class ForgotPasswordRequestScreen extends StatefulWidget {
  const ForgotPasswordRequestScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return ForgotPasswordRequiestScreenState();
  }
}

class ForgotPasswordRequiestScreenState
    extends State<ForgotPasswordRequestScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 130),
        child: Center(
          child: Column(
            children: [
              Text(
                "Forgot Password",
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
                "Enter your email to receive a password reset link",
                style: TextStyle(fontSize: 15, color: grey),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                labelText: "Email",
                controller: emailController,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(text: "Sent Otp", callback: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
