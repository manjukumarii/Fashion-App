import 'package:flutter/material.dart';
import 'package:my_fashion/LocationAccess/location_access_screen.dart';
import 'package:my_fashion/LocationAccess/manual_location.dart';
import 'package:my_fashion/authentication/forgot_password_requiest_screen.dart';
import 'package:my_fashion/authentication/new_password_screen.dart';
import 'package:my_fashion/authentication/otp_screen.dart';
import 'package:my_fashion/authentication/sign_in_page.dart';
import 'package:my_fashion/authentication/sign_up_page.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/homePage/home_page.dart';
import 'package:my_fashion/homePage/home_screen_navigation.dart';
import 'package:my_fashion/onboarding/onboardingPage.dart';
import 'package:my_fashion/profile/profile_screen.dart';
import 'package:my_fashion/providers/home_provider.dart';
import 'package:my_fashion/providers/location_provider.dart';
import 'package:my_fashion/providers/onboarding_provider.dart';
import 'package:my_fashion/providers/product_provider.dart';
import 'package:my_fashion/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ProductProvider())
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          '/splashscreen': (context) => SplashScreen(),
          '/onboardingscreen': (context) => OnboardingPage(),
          '/signinscreen': (context) => SignInPage(),
          '/signupscreen': (context) => SignUpPage(),
          '/forgotpasswordscreen': (context) => ForgotPasswordRequestScreen(),
          '/otpverificationscreen': (context) => OtpScreen(),
          '/newpasswordscreen': (context) => NewPasswordScreen(),
          '/profilescreen': (context) => ProfileScreen(),
          '/locationaccessscreen': (context) => LocationAccessScreen(),
          '/manuallocationscreen': (context) => ManualLocationScreen(),
          '/homescreen': (context) => HomeScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'My Fashion',
        theme: ThemeData(
          primaryColor: brown,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              backgroundColor: brown,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontSize: 20, color: white, fontWeight: FontWeight.bold)),

          //Title Theme
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: HomeScreenNavigation(),
      ),
    );
  }
}
