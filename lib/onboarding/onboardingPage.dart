import 'package:flutter/material.dart';
import 'package:my_fashion/colors.dart';
import 'package:my_fashion/providers/onboarding_provider.dart';
import 'package:my_fashion/static_data_module/onboarding_module.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return OnboardingPageState();
  }
}

class OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: onboardingProvider.pageController,
            itemCount: onboardingPage.length,
            onPageChanged: onboardingProvider.onPageChanged,
            itemBuilder: (context, index) {
              final data = onboardingPage[index];
              return Column(
                children: [
                  // Leave white background for Skip button visibility
                  Container(
                    height: 120,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      data.image,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Expanded container for title, description, and navigation buttons
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, -15),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: data.titleparts
                              .map(
                                (part) => Text(
                                  part.text,
                                  style: TextStyle(
                                    fontSize: 23, // Reduced font size
                                    fontWeight: FontWeight.bold,
                                    color: part.color,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            data.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize:
                                  17, // Adjusted font size for description
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Row with Previous, Indicators, and Next
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Previous Button
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: onboardingProvider.currentPage > 0
                                    ? brown
                                    : Colors.grey.shade300,
                              ),
                              child: IconButton(
                                onPressed: onboardingProvider.previousPage,
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            //smooth page Indicator
                            SmoothPageIndicator(
                              controller: onboardingProvider.pageController,
                              count: onboardingPage.length,
                              effect: ExpandingDotsEffect(
                                dotHeight: 10,
                                dotWidth: 10,
                                activeDotColor: brown,
                                dotColor: Colors.grey.shade400,
                              ),
                            ),

                            // Next Button
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: onboardingProvider.currentPage <
                                        onboardingPage.length
                                    ? brown
                                    : Colors.grey.shade300,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  onboardingProvider.nextPage(context);
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            right: 20,
            top: 40,
            child: TextButton(
              onPressed: () => onboardingProvider.skipToLastPage(),
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 20,
                  color: brown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
