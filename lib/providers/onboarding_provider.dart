import 'package:flutter/material.dart';
import 'package:my_fashion/static_data_module/onboarding_module.dart';

class OnboardingProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPage = 0;

  // Add this getter to expose the onboardingPage to the UI
  List<OnboardingModule> get onBoardingPage => onboardingPage;

  int get currentPage => _currentPage;

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void nextPage(BuildContext context) {
    if (_currentPage < onboardingPage.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to the signup page
      Navigator.pushNamed(context, '/signupscreen');
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToLastPage() {
    pageController.jumpToPage(onboardingPage.length - 1);
  }
}
