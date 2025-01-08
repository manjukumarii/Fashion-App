class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
  });
}

class ProductData {
  static List<Product> allProducts = [
    // Shirts Category
    Product(
      id: '1',
      name: 'Classic White Shirt',
      description:
          'A timeless white shirt that pairs with everything. Perfect for formal and casual occasions.',
      price: 799.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/1st.jpg',
      rating: 4.7,
      reviewCount: 150,
    ),
    Product(
      id: '2',
      name: 'Blue Oxford Shirt',
      description:
          'A sharp blue Oxford shirt ideal for office wear. Soft, breathable, and stylish.',
      price: 849.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/2nd.jpg',
      rating: 4.6,
      reviewCount: 140,
    ),
    Product(
      id: '3',
      name: 'Plaid Flannel Shirt',
      description:
          'A warm and trendy plaid flannel shirt. Perfect for layering during colder months.',
      price: 899.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/3rd.jpg',
      rating: 4.5,
      reviewCount: 120,
    ),
    Product(
      id: '4',
      name: 'Denim Shirt',
      description:
          'A rugged denim shirt for a bold casual look. Durable and versatile for every season.',
      price: 999.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/4th.jpg',
      rating: 4.8,
      reviewCount: 180,
    ),
    Product(
      id: '5',
      name: 'Printed Hawaiian Shirt',
      description:
          'Add some tropical vibes with this vibrant Hawaiian shirt. Perfect for vacations and beach outings.',
      price: 749.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/5th.jpg',
      rating: 4.4,
      reviewCount: 110,
    ),
    Product(
      id: '6',
      name: 'Black Formal Shirt',
      description:
          'A sleek black formal shirt that exudes confidence. Ideal for business meetings and formal dinners.',
      price: 899.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/6th.jpg',
      rating: 4.9,
      reviewCount: 200,
    ),
    Product(
      id: '7',
      name: 'Checked Casual Shirt',
      description:
          'A relaxed-fit checked shirt for a laid-back look. Pair it with jeans or chinos for an effortless style.',
      price: 859.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/7th.jpg',
      rating: 4.3,
      reviewCount: 90,
    ),
    Product(
      id: '8',
      name: 'Cotton Linen Shirt',
      description:
          'A lightweight cotton-linen blend shirt for ultimate comfort. Great for summer days.',
      price: 999.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/8th.jpg',
      rating: 4.5,
      reviewCount: 85,
    ),
    Product(
      id: '9',
      name: 'Grey Chambray Shirt',
      description:
          'A versatile chambray shirt that complements any wardrobe. Simple, stylish, and easy to wear.',
      price: 879.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/9th.jpg',
      rating: 4.6,
      reviewCount: 100,
    ),
    Product(
      id: '10',
      name: 'Retro Polka Dot Shirt',
      description:
          'A playful polka dot shirt for a retro vibe. Stand out with this fun and fashionable piece.',
      price: 899.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/g1.jpg',
      rating: 4.2,
      reviewCount: 80,
    ),
    Product(
      id: '11',
      name: 'Green Military Shirt',
      description:
          'A rugged military-style shirt with chest pockets. Perfect for an adventurous look.',
      price: 919.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/g2.jpg',
      rating: 4.4,
      reviewCount: 88,
    ),
    Product(
      id: '12',
      name: 'Abstract Print Shirt',
      description:
          'A unique abstract print shirt for bold fashion statements. Be the center of attention!',
      price: 999.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/g3.jpg',
      rating: 4.7,
      reviewCount: 120,
    ),
    Product(
      id: '13',
      name: 'Striped Button-Up Shirt',
      description:
          'A classic striped button-up shirt. Stylish and ideal for smart-casual occasions.',
      price: 949.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/g4.jpg',
      rating: 4.5,
      reviewCount: 95,
    ),
    Product(
      id: '14',
      name: 'Tan Corduroy Shirt',
      description:
          'A soft corduroy shirt in a warm tan shade. A great addition to your fall wardrobe.',
      price: 999.99,
      category: 'Shirts',
      imageUrl: 'assets/images/products/shirts/g5.jpg',
      rating: 4.6,
      reviewCount: 105,
    ),

    // Pants Category
    Product(
      id: '15',
      name: 'Classic Chinos',
      description:
          'Versatile chinos that blend comfort and style. Perfect for office or casual wear.',
      price: 1199.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/1st.jpg',
      rating: 4.6,
      reviewCount: 140,
    ),
    Product(
      id: '16',
      name: 'Slim Fit Jeans',
      description:
          'Modern slim-fit jeans with a sleek design. Durable and stylish for any occasion.',
      price: 1399.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/2nd.jpg',
      rating: 4.7,
      reviewCount: 200,
    ),
    Product(
      id: '17',
      name: 'Relaxed Fit Trousers',
      description:
          'Soft and breathable trousers for all-day comfort. Ideal for casual outings.',
      price: 999.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/3rd.jpg',
      rating: 4.5,
      reviewCount: 100,
    ),
    Product(
      id: '18',
      name: 'Cargo Pants',
      description:
          'Utility-inspired cargo pants with multiple pockets. Perfect for adventures or a rugged look.',
      price: 1299.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/4th.jpg',
      rating: 4.4,
      reviewCount: 85,
    ),
    Product(
      id: '19',
      name: 'Black Dress Pants',
      description:
          'Elegant black dress pants for formal occasions. Tailored fit for a sophisticated look.',
      price: 1499.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/5th.jpg',
      rating: 4.8,
      reviewCount: 160,
    ),
    Product(
      id: '20',
      name: 'Jogger Pants',
      description:
          'Comfortable jogger pants with an elastic waistband. Ideal for workouts or casual wear.',
      price: 1099.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/6th.jpg',
      rating: 4.3,
      reviewCount: 90,
    ),
    Product(
      id: '21',
      name: 'Distressed Denim Jeans',
      description:
          'Trendy distressed jeans with a relaxed fit. Great for a modern streetwear look.',
      price: 1499.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/7th.jpg',
      rating: 4.6,
      reviewCount: 120,
    ),
    Product(
      id: '22',
      name: 'Straight-Leg Pants',
      description:
          'Classic straight-leg pants with a timeless design. Perfect for casual and semi-formal settings.',
      price: 1099.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/8th.jpg',
      rating: 4.2,
      reviewCount: 80,
    ),
    Product(
      id: '23',
      name: 'High-Waist Pants',
      description:
          'Stylish high-waist pants for a chic look. Comfortable and easy to pair with tops.',
      price: 1199.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/9th.jpg',
      rating: 4.7,
      reviewCount: 110,
    ),
    Product(
      id: '24',
      name: 'Beige Khakis',
      description:
          'Classic beige khakis for a smart-casual appearance. A wardrobe essential.',
      price: 1299.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/10th.jpg',
      rating: 4.5,
      reviewCount: 95,
    ),
    Product(
      id: '25',
      name: 'Navy Chinos',
      description:
          'Elegant navy chinos with a slim fit. Perfect for office or evening outings.',
      price: 1199.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/g1.jpg',
      rating: 4.6,
      reviewCount: 80,
    ),
    Product(
      id: '26',
      name: 'Olive Cargo Pants',
      description:
          'Stylish olive cargo pants for a rugged, outdoor look. Built for durability.',
      price: 1299.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/g2.jpg',
      rating: 4.4,
      reviewCount: 70,
    ),
    Product(
      id: '27',
      name: 'Charcoal Joggers',
      description:
          'Lightweight and breathable joggers in a versatile charcoal shade. Perfect for any activity.',
      price: 1099.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/g3.jpg',
      rating: 4.3,
      reviewCount: 75,
    ),
    Product(
      id: '28',
      name: 'Classic Fit Pants',
      description:
          'Comfortable classic-fit pants for everyday wear. Designed for practicality and style.',
      price: 999.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/g4.jpg',
      rating: 4.5,
      reviewCount: 65,
    ),
    Product(
      id: '29',
      name: 'Stone-Wash Jeans',
      description:
          'Trendy stone-wash jeans with a modern fit. Perfect for casual outfits.',
      price: 1399.99,
      category: 'Pants',
      imageUrl: 'assets/images/products/pants/g5.jpg',
      rating: 4.7,
      reviewCount: 100,
    ),

// Jackets Category
    Product(
      id: '30',
      name: 'Premium Leather Jacket',
      description:
          'A luxurious leather jacket for the cold winter months. Perfect for adding a touch of class to your look.',
      price: 3999.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/1st.jpg',
      rating: 4.9,
      reviewCount: 220,
    ),
    Product(
      id: '31',
      name: 'Classic Denim Jacket',
      description:
          'Timeless denim jacket with a relaxed fit. Ideal for layering over any casual outfit.',
      price: 2499.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/2nd.jpg',
      rating: 4.7,
      reviewCount: 180,
    ),
    Product(
      id: '32',
      name: 'Puffer Jacket',
      description:
          'Warm and insulated puffer jacket for the coldest winter days. Stylish and practical for outdoor activities.',
      price: 2999.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/3rd.jpg',
      rating: 4.8,
      reviewCount: 200,
    ),
    Product(
      id: '33',
      name: 'Bomber Jacket',
      description:
          'A sleek bomber jacket designed for comfort and style. A great addition to your casual wardrobe.',
      price: 2499.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/4th.jpg',
      rating: 4.6,
      reviewCount: 150,
    ),
    Product(
      id: '34',
      name: 'Windbreaker Jacket',
      description:
          'Lightweight windbreaker for outdoor sports and casual wear. Perfect for breezy days and layering.',
      price: 1799.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/5th.jpg',
      rating: 4.4,
      reviewCount: 100,
    ),
    Product(
      id: '35',
      name: 'Trench Coat',
      description:
          'Elegant trench coat for a sophisticated look. Ideal for both casual and formal settings.',
      price: 3299.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/6th.jpg',
      rating: 4.7,
      reviewCount: 130,
    ),
    Product(
      id: '36',
      name: 'Leather Moto Jacket',
      description:
          'Edgy leather moto jacket designed for the bold. Perfect for motorcycle enthusiasts and fashion-forward individuals.',
      price: 3999.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/7th.jpg',
      rating: 4.8,
      reviewCount: 160,
    ),
    Product(
      id: '37',
      name: 'Fleece Jacket',
      description:
          'Soft and cozy fleece jacket for outdoor activities and casual wear.',
      price: 1699.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/8th.jpg',
      rating: 4.5,
      reviewCount: 110,
    ),
    Product(
      id: '38',
      name: 'Varsity Jacket',
      description:
          'Stylish varsity jacket with a sporty feel. Great for casual outfits and showing school spirit.',
      price: 2499.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/9th.jpg',
      rating: 4.3,
      reviewCount: 90,
    ),
    Product(
      id: '39',
      name: 'Peacoat Jacket',
      description:
          'Classic double-breasted peacoat for a timeless winter look. Warm and stylish for any occasion.',
      price: 3599.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/10th.jpg',
      rating: 4.6,
      reviewCount: 120,
    ),
    Product(
      id: '40',
      name: 'Hooded Jacket',
      description:
          'Casual hooded jacket with a comfortable fit. Ideal for layering on chilly days.',
      price: 1999.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/g1.jpg',
      rating: 4.4,
      reviewCount: 80,
    ),
    Product(
      id: '41',
      name: 'Faux Fur Jacket',
      description:
          'Warm and stylish faux fur jacket for winter fashion. Perfect for cozy outings.',
      price: 2499.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/g2.jpg',
      rating: 4.7,
      reviewCount: 130,
    ),
    Product(
      id: '42',
      name: 'Utility Jacket',
      description:
          'Practical utility jacket with multiple pockets. Ideal for outdoor activities and adventures.',
      price: 1799.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/g3.jpg',
      rating: 4.5,
      reviewCount: 95,
    ),
    Product(
      id: '43',
      name: 'Hiking Jacket',
      description:
          'Durable hiking jacket designed for extreme outdoor conditions. Waterproof and windproof.',
      price: 2899.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/g4.jpg',
      rating: 4.6,
      reviewCount: 105,
    ),
    Product(
      id: '44',
      name: 'Denim Jacket',
      description:
          'Classic denim jacket for a laid-back, stylish look. Great for layering or as a standalone outerwear piece.',
      price: 2299.99,
      category: 'Jackets',
      imageUrl: 'assets/images/products/jackets/g5.jpg',
      rating: 4.8,
      reviewCount: 150,
    ),

// Dresses Category
    Product(
      id: '45',
      name: 'Elegant Evening Dress',
      description:
          'A stunning evening dress designed for special occasions. Perfect for a formal night out or a gala event.',
      price: 1999.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/1st.jpg',
      rating: 4.8,
      reviewCount: 140,
    ),
    Product(
      id: '46',
      name: 'Chic Cocktail Dress',
      description:
          'A glamorous cocktail dress designed for parties and celebrations. Stand out in this trendy yet elegant piece.',
      price: 1799.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/2nd.jpg',
      rating: 4.6,
      reviewCount: 120,
    ),
    Product(
      id: '47',
      name: 'Maxi Dress',
      description:
          'A beautiful flowing maxi dress that gives a relaxed and elegant look for the summer season.',
      price: 2299.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/3rd.jpg',
      rating: 4.7,
      reviewCount: 110,
    ),
    Product(
      id: '48',
      name: 'Floral Summer Dress',
      description:
          'A light and airy floral dress, perfect for the warm days of spring and summer.',
      price: 1499.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/4th.jpg',
      rating: 4.4,
      reviewCount: 95,
    ),
    Product(
      id: '49',
      name: 'Casual Day Dress',
      description:
          'A relaxed fit dress designed for everyday wear. Comfortable and stylish for casual outings.',
      price: 1099.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/5th.jpg',
      rating: 4.5,
      reviewCount: 85,
    ),
    Product(
      id: '50',
      name: 'Evening Gown',
      description:
          'A luxurious evening gown with intricate details, perfect for high-end events and formal gatherings.',
      price: 3999.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/6th.jpg',
      rating: 4.9,
      reviewCount: 160,
    ),
    Product(
      id: '51',
      name: 'Midi Dress',
      description:
          'A sleek and trendy midi dress that combines both comfort and sophistication for a modern look.',
      price: 1699.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/7th.jpg',
      rating: 4.6,
      reviewCount: 140,
    ),
    Product(
      id: '52',
      name: 'Bodycon Dress',
      description:
          'A figure-hugging bodycon dress that highlights your curves while offering maximum comfort.',
      price: 1799.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/8th.jpg',
      rating: 4.8,
      reviewCount: 180,
    ),
    Product(
      id: '53',
      name: 'Bohemian Dress',
      description:
          'A free-spirited bohemian dress, perfect for festivals and casual outdoor activities.',
      price: 1599.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/9th.jpg',
      rating: 4.4,
      reviewCount: 100,
    ),
    Product(
      id: '54',
      name: 'Wedding Dress',
      description:
          'An exquisite wedding dress designed with elegance and grace for your special day.',
      price: 8999.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/10th.jpg',
      rating: 5.0,
      reviewCount: 200,
    ),
    Product(
      id: '55',
      name: 'Boho Chic Dress',
      description:
          'A relaxed and stylish boho-chic dress for casual events or a weekend getaway.',
      price: 1499.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/g1.jpg',
      rating: 4.5,
      reviewCount: 75,
    ),
    Product(
      id: '56',
      name: 'Strapless Dress',
      description:
          'A chic strapless dress with a flattering design. Great for a night out or special occasions.',
      price: 1899.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/g2.jpg',
      rating: 4.6,
      reviewCount: 105,
    ),
    Product(
      id: '57',
      name: 'Asymmetrical Dress',
      description:
          'A modern asymmetrical dress that offers a unique and bold look for any occasion.',
      price: 1599.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/g3.jpg',
      rating: 4.4,
      reviewCount: 80,
    ),
    Product(
      id: '58',
      name: 'A-Line Dress',
      description:
          'A classic A-line dress with a flattering cut that’s perfect for any event, from casual to formal.',
      price: 1699.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/g4.jpg',
      rating: 4.5,
      reviewCount: 90,
    ),
    Product(
      id: '59',
      name: 'Sundress',
      description:
          'A light and breezy sundress for the hot summer days, designed for comfort and style.',
      price: 1299.99,
      category: 'Dresses',
      imageUrl: 'assets/images/products/dress/g5.jpg',
      rating: 4.3,
      reviewCount: 70,
    ),
  ];
}
