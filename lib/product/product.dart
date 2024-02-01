class Product {
  final String _name;
  final String _imagePath;
  late bool _isFavorite;

  Product(this._name, this._imagePath) {
    _isFavorite = false;
  }

  String get name => _name;

  String get imagePath => _imagePath;

  bool get isFavorite => _isFavorite;

  toggleIsFavorite() {
    _isFavorite != _isFavorite;
  }
}
