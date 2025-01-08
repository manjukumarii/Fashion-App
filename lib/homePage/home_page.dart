import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/custom_widgets/custom_banner.dart';
import 'package:my_fashion/custom_widgets/custome_product_list.dart';
import 'package:my_fashion/products/see_all_products_page.dart';
import 'package:my_fashion/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_fashion/providers/location_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final homeProvider = Provider.of<HomeProvider>(context, listen: false);
      homeProvider.startAutoScroll();
      homeProvider.startCountdown();
      homeProvider.fetchCategories2().then((_) {
        if (homeProvider.categories2.isNotEmpty) {
          homeProvider
              .selectCategory(0); // Automatically select the first category
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);

    // Fetch the most relevant address
    String address = locationProvider.searchResults.isNotEmpty
        ? locationProvider.searchResults.first
        : locationProvider.recentSearches.isNotEmpty
            ? locationProvider.recentSearches.last
            : "No location selected";

    String cityAndCountry = locationProvider.getCityAndCountry(address);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location and Notification Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 16,
                      color: grey,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: grey.shade300,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notification_important_sharp,
                        color: brown,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on, color: brown),
                  Expanded(
                    child: Text(
                      cityAndCountry,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Search Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: const TextStyle(color: grey, fontSize: 17),
                        prefixIcon: const Icon(Icons.search, color: grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(width: 2, color: grey),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: brown,
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/svg_icon/filter.svg',
                        height: 24,
                        width: 24,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print("Filter tapped!");
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Banners
              SizedBox(
                height: 230,
                child: PageView.builder(
                  controller: homeProvider.pageController,
                  itemCount: homeProvider.banners.length,
                  itemBuilder: (context, index) {
                    return CustomBanner(banner: homeProvider.banners[index]);
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: homeProvider.pageController,
                  count: homeProvider.banners.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: brown,
                    dotColor: grey,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SeeAllProductsPage();
                        }));
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(color: brown, fontSize: 15),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeProvider.categories.length,
                    itemBuilder: (context, index) {
                      final category = homeProvider.categories[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.brown.shade50,
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    category["image"]!,
                                    color: brown,
                                    height: 40,
                                    width: 40,
                                  )),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: Text(
                                category["name"]!,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Flash Sale",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Closing in : ",
                        style: TextStyle(fontSize: 18),
                      ),
                      //hour
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.brown.shade50,
                        ),
                        child: Center(
                          child: Text(homeProvider.hours),
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(fontSize: 18),
                      ),
                      //minute
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.brown.shade50,
                        ),
                        child: Center(
                          child: Text(homeProvider.minutes),
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(fontSize: 18),
                      ),
                      //second

                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.brown.shade50,
                        ),
                        child: Center(
                          child: Text(homeProvider.seconds),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              // Categories List (with loading state handling)
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeProvider.categories2.length,
                  itemBuilder: (context, index) {
                    final category = homeProvider.categories2[index];
                    final isSelected =
                        homeProvider.selectCategoryIndex == index;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          homeProvider.selectCategory(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: isSelected ? brown : grey,
                            ),
                            shape: BoxShape.rectangle,
                            color: isSelected ? brown : Colors.brown.shade100,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Text(
                                category,
                                style: TextStyle(
                                    color: isSelected ? white : black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              CustomProductList(),
            ],
          ),
        ),
      ),
    );
  }
}
