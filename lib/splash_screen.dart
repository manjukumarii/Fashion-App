import 'package:flutter/material.dart';
import 'package:my_fashion/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController imageController;
  late AnimationController textController;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    // Image Animation
    imageController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    scaleAnimation =
        Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(
      parent: imageController,
      curve: Curves.easeInOut,
    ));

    // Text Animation
    textController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    slideAnimation =
        Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
            .animate(CurvedAnimation(
      parent: textController,
      curve: Curves.easeInOut,
    ));

    // Start Animations
    imageController.forward().then((_) => textController.forward());

    // Navigate to Welcome Screen after animations
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    imageController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Image (F)
            ScaleTransition(
              scale: scaleAnimation,
              child: FadeTransition(
                opacity: imageController,
                child: Image.asset(
                  'assets/images/flogo.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(width: 10),
            // Animated Text (ashion)
            SlideTransition(
              position: slideAnimation,
              child: FadeTransition(
                opacity: textController,
                child: Text(
                  "fashion",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
