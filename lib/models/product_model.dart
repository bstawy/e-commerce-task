class ProductModel {
  String title;
  String description;
  int? originalPrice;
  int offeredPrice;
  String imagePath;
  double rating;
  bool isFavourited;

  ProductModel({
    required this.title,
    required this.description,
    required this.originalPrice,
    required this.offeredPrice,
    required this.imagePath,
    required this.rating,
    required this.isFavourited,
  });
}
