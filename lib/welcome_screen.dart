import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/custom_widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: Column(
          children: [
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align both to the top
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Image.asset(
                    "assets/images/welcome_image/1st.jpg",
                    height: 400,
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10), // Add spacing between images
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align the column to the start
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(130)),
                      child: Image.asset(
                        "assets/images/welcome_image/2nd.jpg",
                        height: 240,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(75)),
                      child: Image.asset(
                        "assets/images/welcome_image/3rd.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "The ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: black),
                    children: [
                      TextSpan(
                          text: "Fashion App ",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: brown)),
                      TextSpan(
                          text: "That Makes You Look Your Best",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: black)),
                    ])),
            SizedBox(
              height: 20,
            ),
            Text(
              "Discover trendy styles and shop effortlessly for chic girls' fashion with My Fashion App!",
              style: TextStyle(fontSize: 16, color: grey),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              callback: () {
                Navigator.pushNamed(context, "/onboardingscreen");
              },
              text: "Let's Get Started",
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 16, color: black),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: 18, color: brown),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
