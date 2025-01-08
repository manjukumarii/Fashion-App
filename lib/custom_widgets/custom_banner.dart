import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/static_data_module/banner_module.dart';

class CustomBanner extends StatelessWidget {
  final BannerModule banner;

  const CustomBanner({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.brown.shade100,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Text Section
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  banner.title ?? 'No Title',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  banner.desc ?? 'No Description',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    // Add action for the button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Shop Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Image Section
          Expanded(
            flex: 2,
            child: Transform.scale(
              scale:
                  1.2, // Adjust this value to control the zoom level (1.0 = normal size)
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  banner.image ?? "",
                  fit: BoxFit
                      .cover, // Ensures the image covers the space proportionally
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
