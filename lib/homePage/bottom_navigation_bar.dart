import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/providers/home_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return CustomBottomNavigationBarState();
  }
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        margin: EdgeInsets.all(8),
        height: 70,
        decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: white,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context,
              icon: Icons.home,
              index: 0,
              homeProvider: homeProvider,
            ),
            _buildNavItem(
              context,
              icon: Icons.shopping_bag_outlined,
              index: 1,
              homeProvider: homeProvider,
            ),
            _buildNavItem(
              context,
              icon: Icons.favorite_rounded,
              index: 2,
              homeProvider: homeProvider,
            ),
            _buildNavItem(
              context,
              icon: Icons.message_rounded,
              index: 3,
              homeProvider: homeProvider,
            ),
            _buildNavItem(
              context,
              icon: Icons.person,
              index: 4,
              homeProvider: homeProvider,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required int index,
    required HomeProvider homeProvider,
  }) {
    final isSelected = homeProvider.currentIndex == index;

    return GestureDetector(
      onTap: () => homeProvider.updateIndex(index),
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: 60,
        height: 60,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: 30,
          color: isSelected ? brown : Colors.grey,
        ),
      ),
    );
  }
}
