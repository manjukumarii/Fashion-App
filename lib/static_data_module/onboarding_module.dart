class OnboardingModule {
  final String image;
  final String title;
  final String browntitle;
  final String description;

  OnboardingModule({
    required this.image,
    required this.title,
    required this.browntitle,
    required this.description,
  });
}

List<OnboardingModule> onboardingPage = [
  OnboardingModule(
    image: "assets/images/onboarding/1st.jpg",
    title: "title",
    browntitle: "browntitle",
    description: "description",
  ),
];
