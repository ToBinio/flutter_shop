import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/layout/layout.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return const Layout(
      title: "Prodcuts",
      child: Text("Products"),
    );
  }
}
