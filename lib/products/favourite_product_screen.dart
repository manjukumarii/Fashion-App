import 'package:flutter/material.dart';
import 'package:my_fashion/products/product_card.dart';
import 'package:my_fashion/providers/product_provider.dart';
import 'package:provider/provider.dart';

class FavouriteProductScreen extends StatefulWidget {
  const FavouriteProductScreen({super.key});

  @override
  _FavouriteProductScreenState createState() => _FavouriteProductScreenState();
}

class _FavouriteProductScreenState extends State<FavouriteProductScreen> {
  final List<String> categories = [
    'All',
    'Shirts',
    'Pants',
    'Jackets',
    'Dresses',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      // Use Consumer here
      builder: (context, productProvider, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Bar
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Spacer(),
                    const Text(
                      "My Wishlist",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
                const SizedBox(height: 30),

                // Categories
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return GestureDetector(
                        onTap: () {
                          productProvider.updateCategory(category);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: productProvider.selectedCategory == category
                                ? Colors.brown
                                : Colors.brown[50],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              category,
                              style: TextStyle(
                                color:
                                    productProvider.selectedCategory == category
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Favorite Products
                Expanded(
                  child: productProvider.favoriteProducts.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: productProvider.favoriteProducts.length,
                          itemBuilder: (context, index) {
                            final product =
                                productProvider.favoriteProducts[index];
                            return ProductCard(product: product);
                          },
                        )
                      : const Center(
                          child: Text(
                            "No items in your wishlist.",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
