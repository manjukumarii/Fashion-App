import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';

class CustomImageButton extends StatelessWidget {
  final String image;
  final VoidCallback callback;
  const CustomImageButton({
    super.key,
    required this.callback,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
            color: grey,
            width: 1,
          )),
      child: InkWell(
        onTap: () {
          callback;
        },
        child: Center(
          child: Image.asset(
            image,
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}
