import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/custom_widgets/custom_button.dart';
import 'package:my_fashion/providers/product_provider.dart';
import 'package:provider/provider.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ProductProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  // Back Button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.brown.shade100,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Navigate back
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const SizedBox(width: 80),
                  const Text(
                    "My Cart",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Cart Items or Empty State
            cartItems.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text(
                        'Your cart is empty',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final productId = cartItems.keys.elementAt(index);
                        final product = cartProvider.getProductById(productId);

                        if (product == null) {
                          return const Text('Product not found');
                        }

                        return Dismissible(
                          key: Key(productId),
                          direction:
                              DismissDirection.startToEnd, // Swipe left only
                          onDismissed: (direction) {
                            // Handle the deletion of the item
                            cartProvider.removeFromCart(productId);
                          },
                          confirmDismiss: (direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              final shouldDelete =
                                  await showModalBottomSheet<bool>(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Remove From Cart?',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: Divider(
                                            height: 2,
                                            color: grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ListTile(
                                          leading: Container(
                                            width: 50,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: black,
                                                    offset: Offset(0, 3),
                                                  )
                                                ]),
                                            child:
                                                Image.asset(product.imageUrl),
                                          ),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                "₹ ${product.price}",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // Decrement Button
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: grey,
                                                ),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      cartProvider
                                                          .decrementProductQuantity(
                                                              productId);
                                                    },
                                                    icon: const Icon(
                                                      Icons.remove,
                                                      size: 16,
                                                      color: white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              // Display quantity
                                              Text(
                                                '${cartItems[productId]}',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(width: 8),
                                              // Increment Button
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: brown,
                                                ),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      cartProvider
                                                          .incrementProductQuantity(
                                                              productId);
                                                    },
                                                    icon: const Icon(
                                                      Icons.add,
                                                      color: white,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(false); // Cancel
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.grey.shade300,
                                              ),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(true); // Confirm
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: brown,
                                              ),
                                              child: const Text(
                                                'Yes, Remove',
                                                style: TextStyle(
                                                  color: white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              return shouldDelete ??
                                  false; // Default to false if null
                            }
                            return false; // Prevent dismissal in other directions
                          },

                          background: Container(
                            color:
                                Colors.pink.shade100, // Light pink background
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 20),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red, // Red icon color
                            ),
                          ),
                          child: ListTile(
                            leading: Card(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  height: 170,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Image.asset(
                                    product.imageUrl,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "₹ ${product.price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Decrement Button
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8),
                                    color: grey,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      onPressed: () {
                                        cartProvider.decrementProductQuantity(
                                            productId);
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 16,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Display quantity
                                Text(
                                  '${cartItems[productId]}',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(width: 8),
                                // Increment Button
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8),
                                    color: brown,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      onPressed: () {
                                        cartProvider.incrementProductQuantity(
                                            productId);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),

            //bottom part

            // Elevated Container at the Bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20), // Rounded top border
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Subtle shadow
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                width: double.infinity, // Full width
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    const Text(
                      "Apply Coupon Code",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Row with TextField and Apply Button
                    Row(
                      children: [
                        // TextField for Coupon Code
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              hintText: "Enter coupon code",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: brown),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Apply Button
                        ElevatedButton(
                          onPressed: () {
                            // Handle Apply Coupon logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: brown,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Apply",
                            style: TextStyle(fontSize: 16, color: white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Total",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: grey,
                                ),
                              ),
                              Text(
                                "rs. 8989",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery fee",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: grey,
                                ),
                              ),
                              Text(
                                "rs. 50",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: grey,
                                ),
                              ),
                              Text(
                                "rs. 100",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(
                              height: 2,
                              color: grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total cost",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: grey,
                                ),
                              ),
                              Text(
                                "rs. 8989",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            child: CustomButton(
                                text: "Proceed to checkout", callback: () {}),
                          )
                        ],
                      ),
                    )
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
