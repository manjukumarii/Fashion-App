import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? text;
  IconData? icon;
  VoidCallback? callback;
  Color? color;

  CustomButton(
      {super.key,
      required this.text,
      this.icon,
      required this.callback,
      this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: brown,
        padding: EdgeInsets.symmetric(
            vertical: 11, horizontal: 11), // Adjust button height
      ),
      child: Center(
        // Center the entire content
        child: Row(
          mainAxisSize: MainAxisSize.min, // Keeps the row compact
          children: [
            if (icon != null)
              Icon(
                icon,
                color: white,
                size: 20,
              ), // Add icon only if not null
            if (icon != null)
              SizedBox(width: 10), // Space between icon and text
            Text(
              text.toString(),
              style: TextStyle(fontSize: 20, color: white),
            ),
          ],
        ),
      ),
    );
  }
}
