class ProductData {
  String name;
  String imagePath;
  double price;
  late bool isFavorite;

  ProductData(this.name, this.imagePath, this.price) {
    isFavorite = false;
  }

  toggleIsFavorite() {
    isFavorite = !isFavorite;
  }
}
