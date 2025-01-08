import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';

class TitleParts {
  final String text;
  final Color color;

  TitleParts({
    required this.text,
    required this.color,
  });
}

class OnboardingModule {
  final List<TitleParts> titleparts;
  final String image;
  final String description;

  OnboardingModule({
    required this.titleparts,
    required this.image,
    required this.description,
  });
}

List<OnboardingModule> onboardingPage = [
  OnboardingModule(
    titleparts: [
      TitleParts(text: "Seamless ", color: brown),
      TitleParts(text: " Shopping Experience ", color: black),
    ],
    image: "assets/images/onboarding/1st.jpg",
    description:
        "Add your favorite items to the cart and enjoy a smooth shopping experience with secure payment options and fast checkout.",
  ),
  OnboardingModule(
    titleparts: [
      TitleParts(text: "Where ", color: black),
      TitleParts(text: "Fashion Dreams", color: brown),
      TitleParts(text: "Begin", color: black),
    ],
    image: "assets/images/onboarding/2nd.jpeg",
    description:
        "Explore a wide range of products tailored to your needs. Shop the latest trends and essential items, all in one place!",
  ),
  OnboardingModule(
    titleparts: [
      TitleParts(text: "Swift ", color: brown),
      TitleParts(text: "and ", color: black),
      TitleParts(text: "Reliable ", color: brown),
      TitleParts(text: "Delivery", color: black),
    ],
    image: "assets/images/onboarding/3rd.jpeg",
    description:
        "Stay updated with real-time order tracking and manage your deliveries with ease for a hassle-free shopping journey.",
  ),
];
