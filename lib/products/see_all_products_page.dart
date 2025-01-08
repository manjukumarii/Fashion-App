import 'package:flutter/material.dart';
import 'package:my_fashion/products/product_card.dart';
import 'package:provider/provider.dart';
import 'package:my_fashion/providers/product_provider.dart';

class SeeAllProductsPage extends StatefulWidget {
  const SeeAllProductsPage({super.key});

  @override
  State<StatefulWidget> createState() => SeeAllProductsPageState();
}

class SeeAllProductsPageState extends State<SeeAllProductsPage> {
  final List<String> categories = [
    'All',
    'Shirts',
    'Pants',
    'Jackets',
    'Dresses'
  ];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
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
                  "All Products",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
              ],
            ),

            const SizedBox(height: 10),

            // Category Selector
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
                            color: productProvider.selectedCategory == category
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

            // Product Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: productProvider.filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = productProvider.filteredProducts[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
