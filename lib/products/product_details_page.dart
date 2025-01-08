import "package:flutter/material.dart";
import "package:my_fashion/colors.dart";
import "package:my_fashion/custom_widgets/custom_button.dart";

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row with Back Arrow, Title, and Wishlist Icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.brown.shade50,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(
                            context); // Go back to the previous screen
                      },
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Product Details',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.brown.shade50),
                    child: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        // Add to wishlist logic here
                        print('Added to Wishlist: ${product['title']}');
                      },
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Add Space Between Widgets and Image
            SizedBox(height: 20),
            // Image Container
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(product['image']),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Product Title and Price
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product['category'],
                    style: TextStyle(fontSize: 17, color: grey),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: golden,
                        size: 25,
                      ),
                      Text(
                        product["rating"]['rate'].toString(),
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                product['title'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Product Details ",
                style: TextStyle(
                    fontSize: 20, color: black, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                textAlign: TextAlign.justify,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                product['description'],
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),

            // Container for Total Price and Add to Cart Button
            Spacer(), // To push the bottom container to the bottom
            Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    spreadRadius: 1,
                    offset: Offset(0, -2), // Bottom shadow
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Total Price
                    Column(
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(fontSize: 17, color: grey),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "₹ ${product['price']}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Add to Cart Button
                    CustomButton(
                      text: "Add to Cart",
                      icon: Icons.shopping_cart,
                      callback: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
