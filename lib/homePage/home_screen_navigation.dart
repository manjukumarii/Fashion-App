import 'package:flutter/material.dart';
import 'package:my_fashion/homePage/bottom_navigation_bar.dart';
import 'package:my_fashion/homePage/home_page.dart';
import 'package:my_fashion/products/favourite_product_screen.dart';
import 'package:my_fashion/products/my_cart_screen.dart';
import 'package:my_fashion/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreenNavigation extends StatelessWidget {
  const HomeScreenNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    final screens = [
      HomeScreen(),
      MyCartScreen(),
      FavouriteProductScreen(),
      Center(child: Text('chat')),
      Center(child: Text('Profile Screen')),
    ];

    return Scaffold(
      body: screens[homeProvider.currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
