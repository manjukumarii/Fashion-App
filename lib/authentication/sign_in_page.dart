import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/custom_widgets/custom_button.dart';
import 'package:my_fashion/custom_widgets/custom_image_button.dart';
import 'package:my_fashion/custom_widgets/custom_textfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return SignInPageState();
  }
}

class SignInPageState extends State<SignInPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Hi! welcome back, you've been missed",
                    style: TextStyle(fontSize: 16, color: grey),
                  ),
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
                // forgot password
                Padding(
                  padding: const EdgeInsets.only(left: 190),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: brown,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),

                CustomButton(text: "Sign In", callback: () {}),
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
                      "  or sign in with  ",
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
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 17,
                            color: brown,
                            decoration: TextDecoration.underline,
                          ),
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
