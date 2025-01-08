import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_fashion/static_data_module/banner_module.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  // from here i am implementing Banner Autoscrolable logic
  final PageController pageController = PageController();
  Timer? autoScrollTimer; // For auto-scroll
  Timer? countdownTimer; // For countdown
  int currentPage = 0;

  List<BannerModule> banners = bannerModuledata;

  void startAutoScroll() {
    autoScrollTimer = Timer.periodic(Duration(seconds: 3), (_) {
      currentPage = (currentPage + 1) % banners.length;
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      notifyListeners();
    });
  }

  void stopAutoScroll() {
    autoScrollTimer?.cancel();
    autoScrollTimer = null;
  }

  // catogory functions starts from here
  final List<Map<String, String>> categories = [
    {"name": "Shirts", "image": "assets/images/svg_icon/shirt.svg"},
    {"name": "Pants", "image": "assets/images/svg_icon/pants.svg"},
    {"name": "Jackets", "image": "assets/images/svg_icon/dress.svg"},
    {"name": "Dress", "image": "assets/images/svg_icon/jacket.svg"},
  ];

  //Flash Sale part starts here
  Duration remainingTime = Duration(hours: 2, minutes: 12, seconds: 56);

  Duration get remainTime => remainingTime;

  String get hours => remainingTime.inHours.toString().padLeft(2, '0');
  String get minutes =>
      (remainingTime.inMinutes % 60).toString().padLeft(2, '0');
  String get seconds =>
      (remainingTime.inSeconds % 60).toString().padLeft(2, '0');

  void startCountdown() {
    countdownTimer?.cancel(); // Cancel any existing timer
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        remainingTime -= Duration(seconds: 1);
        notifyListeners(); // Notify listeners to rebuild UI
      } else {
        timer.cancel(); // Stop the timer when it reaches zero
      }
    });
  }

  void stopCountdown() {
    countdownTimer?.cancel();
  }

  void resetCountdown(Duration duration) {
    countdownTimer?.cancel();
    remainingTime = duration;
    notifyListeners();
  }

  // Categories
  List<String> categories2 = [];
  bool isLoading = false;

  Future<void> fetchCategories2() async {
    print("Categories fetched: $categories2");
    isLoading = true;
    notifyListeners(); // Notify listeners that loading has started.

    try {
      final response = await http
          .get(Uri.parse("https://fakestoreapi.com/products/categories"));
      if (response.statusCode == 200) {
        // Ensure categories are correctly decoded.
        List<String> fetchedCategories =
            List<String>.from(jsonDecode(response.body));
        categories2 = fetchedCategories;
      } else {
        throw Exception("Failed to load categories");
      }
    } catch (error) {
      print("Error fetching categories: $error");
    } finally {
      isLoading = false;
      notifyListeners(); // Notify listeners after loading is done.
    }
  }

  int selectCategoryIndex = -1;

  // Method to update selected category index
  void selectCategory(int index) {
    selectCategoryIndex = index;
    fetchProducts(categories2[index]);
    notifyListeners();
  }

  // Products Logic
  List<dynamic> products = [];

  Future<void> fetchProducts(String category) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
          Uri.parse('https://fakestoreapi.com/products/category/$category'));
      if (response.statusCode == 200) {
        products = jsonDecode(response.body);
      } else {
        throw Exception("Failed to load products");
      }
    } catch (error) {
      debugPrint("Error fetching products: $error");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //navigation logic
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  @override
  void dispose() {
    stopAutoScroll();
    pageController.dispose();
    super.dispose();
    countdownTimer?.cancel();
  }
}
