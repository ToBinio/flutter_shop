class ProductData {
  String name;
  String imagePath;
  String description;
  double price;
  late bool isFavorite;

  ProductData(this.name, this.imagePath, this.price, this.description) {
    isFavorite = false;
  }

  toggleIsFavorite() {
    isFavorite = !isFavorite;
  }
}
