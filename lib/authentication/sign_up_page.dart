import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/custom_widgets/custom_button.dart';
import 'package:my_fashion/custom_widgets/custom_image_button.dart';
import 'package:my_fashion/custom_widgets/custom_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Fill your information below or register with your social account.",
                    style: TextStyle(fontSize: 16, color: grey),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelText: "Name",
                  controller: nameController,
                  hintText: "Enter your name",
                ),

                SizedBox(
                  height: 20,
                ),

                // email textfield
                CustomTextField(
                  labelText: "Email",
                  controller: emailController,
                  hintText: "Enter your email",
                ),

                SizedBox(
                  height: 20,
                ),

                CustomTextField(
                  labelText: "Password",
                  controller: passwordController,
                  hintText: "Enter your password",
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      fillColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.disabled)) {
                          return white;
                        }
                        return isChecked ? brown : grey;
                      }), // Dynamic color based on state
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Agree with ",
                        style: TextStyle(
                          fontSize: 17,
                          color: black,
                        ),
                        children: [
                          TextSpan(
                              text: "Term & Conditions",
                              style: TextStyle(
                                fontSize: 17,
                                color: brown,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //returns terms & conditions page
                                }),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                CustomButton(text: "Sign Up", callback: () {}),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 3,
                        thickness: 2,
                        color: grey,
                      ),
                    ),
                    Text(
                      "  or sign up with  ",
                      style: TextStyle(fontSize: 14, color: grey),
                    ),
                    Expanded(
                      child: Divider(
                        height: 2,
                        thickness: 2,
                        color: grey,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomImageButton(
                        callback: () {},
                        image: "assets/images/social_media/insta_logo.jpg"),
                    CustomImageButton(
                        callback: () {},
                        image: "assets/images/social_media/g_logo.png"),
                    CustomImageButton(
                        callback: () {},
                        image: "assets/images/social_media/f_logo.jpg"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 17,
                              color: brown),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
