class BannerModule {
  String? image;
  String? title;
  String? desc;

  BannerModule({
    required this.image,
    required this.title,
    required this.desc,
  });
}

List<BannerModule> bannerModuledata = [
  BannerModule(
      image: "assets/images/banner/1st.png",
      title: "Winter Wonderland Sale",
      desc:
          "Stay stylish this winter! Up to 50% off on coats, boots, and sweaters."),
  BannerModule(
      image: "assets/images/banner/2ndd.png",
      title: "Fresh Trends, Just In",
      desc: "Discover the latest styles in our new arrivals section."),
  BannerModule(
      image: "assets/images/banner/3rd.png",
      title: "Celebrate in Style",
      desc:
          'Traditional outfits for every festive occasion. Find your perfect look now!'),
  BannerModule(
      image: "assets/images/banner/4th.png",
      title: "Everyday Essentials",
      desc: "Stay comfortable and chic with our casual wear collection."),
  BannerModule(
      image: "assets/images/banner/5th.png",
      title: "Complete Your Look",
      desc:
          "From bags to belts, find the perfect accessories for every outfit."),
  BannerModule(
      image: "assets/images/banner/6th.png",
      title: "Shine Bright Tonight",
      desc:
          "Dazzle at every party with our stunning collection of gowns and suits."),
  BannerModule(
      image: "assets/images/banner/7th.png",
      title: "Adorable & Stylish",
      desc: "Trendy and comfy outfits for your little ones."),
];
