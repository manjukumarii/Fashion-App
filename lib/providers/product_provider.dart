import 'package:flutter/material.dart';
import 'package:my_fashion/static_data_module/product_module.dart';

class ProductProvider with ChangeNotifier {
  String _selectedCategory = 'All';
  String get selectedCategory => _selectedCategory;

  // All available products
  List<Product> products = ProductData.allProducts;

  // Set to store favorite product IDs
  final Set<String> _favoriteProductIds = {};

  // Map to store cart items (productId -> quantity)
  final Map<String, int> _cartItems = {};

  /// Updates the selected category and notifies listeners
  void updateCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  /// Checks if a product is marked as favorite
  bool isFavorite(String productId) {
    return _favoriteProductIds.contains(productId);
  }

  /// Toggles the favorite status of a product and returns its new status
  bool toggleFavoriteStatus(String productId) {
    if (_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.remove(productId);
    } else {
      _favoriteProductIds.add(productId);
    }
    notifyListeners();
    return _favoriteProductIds.contains(productId);
  }

  /// Gets the list of products filtered by the selected category
  List<Product> get filteredProducts {
    if (_selectedCategory == 'All') {
      return products;
    }
    return products
        .where((product) => product.category == _selectedCategory)
        .toList();
  }

  /// Gets the list of favorite products filtered by the selected category
  List<Product> get favoriteProducts {
    final favorites = products
        .where((product) => _favoriteProductIds.contains(product.id))
        .toList();

    if (_selectedCategory == 'All') {
      return favorites;
    }
    return favorites
        .where((product) => product.category == _selectedCategory)
        .toList();
  }

  // ---------------- Cart Logic ----------------

  /// Add a product to the cart or increase its quantity
  void addToCart(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems[productId] = _cartItems[productId]! + 1; // Increment quantity
    } else {
      _cartItems[productId] = 1; // Add product with quantity 1
    }
    notifyListeners();
  }

  /// Remove a product or decrease its quantity
  void removeFromCart(String productId) {
    if (_cartItems.containsKey(productId)) {
      if (_cartItems[productId]! > 1) {
        _cartItems[productId] = _cartItems[productId]! - 1; // Decrease quantity
      } else {
        _cartItems.remove(productId); // Remove product if quantity is 1
      }
      notifyListeners();
    }
  }

  /// Increment the quantity of a product in the cart
  void incrementProductQuantity(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems[productId] = _cartItems[productId]! + 1;
    } else {
      _cartItems[productId] = 1; // Add product with quantity 1 if not present
    }
    notifyListeners();
  }

  /// Decrement the quantity of a product in the cart
  void decrementProductQuantity(String productId) {
    if (_cartItems.containsKey(productId)) {
      if (_cartItems[productId]! > 1) {
        _cartItems[productId] = _cartItems[productId]! - 1; // Decrease quantity
      } else {
        _cartItems.remove(productId); // Remove product if quantity is 1
      }
      notifyListeners();
    }
  }

  /// Get the cart items as a map
  Map<String, int> get cartItems => _cartItems;

  /// Get the total number of items in the cart
  int get totalItems {
    return _cartItems.values.fold(0, (sum, quantity) => sum + quantity);
  }

  /// Get product details by ID
  Product? getProductById(String productId) {
    try {
      return products.firstWhere((product) => product.id == productId);
    } catch (e) {
      return null; // Return null if product not found
    }
  }

  /// Get the total price of items in the cart
  double get totalPrice {
    double total = 0.0;
    _cartItems.forEach((productId, quantity) {
      final product = getProductById(productId);
      if (product != null) {
        total += product.price * quantity;
      }
    });
    return total;
  }
}
