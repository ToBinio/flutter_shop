class ProductData {
  final String _name;
  final String _imagePath;
  final double _price;
  late bool _isFavorite;

  ProductData(this._name, this._imagePath, this._price) {
    _isFavorite = false;
  }

  String get name => _name;

  String get imagePath => _imagePath;

  bool get isFavorite => _isFavorite;


  double get price => _price;

  toggleIsFavorite() {
    _isFavorite = !_isFavorite;
  }
}
