import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../product/product_data.dart';
import '../provider/product_provider.dart';

class ProductEdit extends StatefulWidget {
  ProductData? productData;
  String title;

  ProductEdit(this.productData, this.title, {Key? key}) : super(key: key);

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final TextEditingController name = TextEditingController();
  bool nameError = false;

  final TextEditingController price = TextEditingController();
  bool priceError = false;

  final TextEditingController description = TextEditingController();
  bool descriptionError = false;

  final TextEditingController imagePath = TextEditingController();
  bool imagePathError = false;

  @override
  void initState() {
    if (widget.productData != null) {
      name.text = widget.productData!.name;
      price.text = widget.productData!.price.toString();
      description.text = widget.productData!.description;
      imagePath.text = widget.productData!.imagePath;
    }

    super.initState();
  }

  void save() {
    setState(() {
      nameError = name.text.isEmpty;
      descriptionError = description.text.isEmpty;
      imagePathError = imagePath.text.isEmpty;

      try {
        double.parse(price.text);
        priceError = false;
      } catch (e) {
        priceError = true;
      }
    });

    if (nameError || descriptionError || imagePathError || priceError) return;

    if (widget.productData == null) {
      final ProductProvider productProvider =
          Provider.of<ProductProvider>(context, listen: false);

      var product = ProductData(name.text, description.text,
          double.parse(price.text), imagePath.text);

      widget.productData = product;
      productProvider.add(product);
    }

    widget.productData!.name = name.text;
    widget.productData!.price = double.parse(price.text);
    widget.productData!.description = description.text;
    widget.productData!.imagePath = imagePath.text;

    Navigator.pushNamed(context, "/products");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                save();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Name",
                      errorText: nameError
                          ? "can not be empty"
                          : null),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: price,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Price",
                      errorText: priceError
                          ? "must be a number"
                          : null),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: description,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Description",
                      errorText: descriptionError
                          ? "can not be empty"
                          : null),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: imagePath,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Image URL",
                      errorText: imagePathError
                          ? "can not be empty"
                          : null),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
