import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/products/static_product_details_page.dart';
import 'package:my_fashion/providers/product_provider.dart';
import 'package:my_fashion/static_data_module/product_module.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<ProductProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) {
            return StaticProductDetailsPage(product: product);
          },
        ));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Product Image with Favorite Icon
            if (product.imageUrl.isNotEmpty)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      product.imageUrl, // Use Image.network for network URLs
                      fit: BoxFit.contain,
                      height: 150,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 150,
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: Icon(Icons.broken_image, size: 40),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.brown.shade50,
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Toggle favorite status
                          final isNowFavorite = favouriteProvider
                              .toggleFavoriteStatus(product.id);

                          // Show a SnackBar based on the action
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                isNowFavorite
                                    ? "${product.name} added to the wishlist"
                                    : "${product.name} removed from the wishlist",
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        icon: Icon(
                          favouriteProvider.isFavorite(product.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favouriteProvider.isFavorite(product.id)
                              ? brown
                              : brown,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            // Product Name and Rating
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Product Name
                  Expanded(
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),

                  // Rating
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: golden,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        product.rating.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Product Price
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '₹${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
