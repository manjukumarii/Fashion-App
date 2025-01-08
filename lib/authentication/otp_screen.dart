import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/custom_widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return OtpScreenState();
  }
}

class OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 100,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "Verify Code",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "please enter the code we just sent to email",
                style: TextStyle(fontSize: 15, color: grey),
              ),
              Text(
                "example@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                  color: brown,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      onSaved: (pin3) {},
                      decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(color: Colors.white24),
                          fillColor: Colors.brown.shade50,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              width: 1,
                              color: brown,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 1,
                                color: grey,
                              ))),
                    ),
                  ),

                  //second

                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      onSaved: (pin3) {},
                      decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(color: Colors.white24),
                          fillColor: Colors.brown.shade50,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              width: 1,
                              color: brown,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 1,
                                color: grey,
                              ))),
                    ),
                  ),

                  //3rd

                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      onSaved: (pin3) {},
                      decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(color: Colors.white24),
                          fillColor: Colors.brown.shade50,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              width: 1,
                              color: brown,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 1,
                                color: grey,
                              ))),
                    ),
                  ),

                  //forth

                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      onSaved: (pin3) {},
                      decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(color: Colors.white24),
                          fillColor: Colors.brown.shade50,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              width: 1,
                              color: brown,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 1,
                                color: grey,
                              ))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Did'nt Receive Otp?",
                style: TextStyle(
                  fontSize: 16,
                  color: grey,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                      fontSize: 17,
                      color: brown,
                      decoration: TextDecoration.underline),
                ),
              ),
              CustomButton(
                text: "Verify Otp",
                callback: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
