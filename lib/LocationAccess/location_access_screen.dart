import 'package:flutter/material.dart';
import 'package:my_fashion/providers/location_provider.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/custom_widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});

  @override
  State<StatefulWidget> createState() => LocationAccessScreenState();
}

class LocationAccessScreenState extends State<LocationAccessScreen> {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: grey.shade300,
                child: Icon(
                  Icons.location_on_rounded,
                  size: 60,
                  color: brown,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "What is your location?",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "We need to know your location in order to suggest nearby services.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: grey,
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Allow Location Access",
                callback: () {
                  locationProvider.requestLocationPermission();
                },
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  // Implement manual location entry logic here
                },
                child: const Text(
                  "Enter Location Manually",
                  style: TextStyle(
                    fontSize: 16,
                    color: brown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
