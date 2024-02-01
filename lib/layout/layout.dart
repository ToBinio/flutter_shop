import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final String title;

  const Layout({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(children: [
          ListTile(
            title: const Row(
              children: [Icon(Icons.place), Text("Shop")],
            ),
            onTap: () => {Navigator.pushNamed(context, "/shop")},
          ),
          ListTile(
            title: const Row(
              children: [Icon(Icons.place), Text("Orders")],
            ),
            onTap: () => {Navigator.pushNamed(context, "/orders")},
          ),
          ListTile(
            title: const Row(
              children: [Icon(Icons.place), Text("Manage Products")],
            ),
            onTap: () => {Navigator.pushNamed(context, "/products")},
          ),
        ]), // Populate the Drawer in the next step.
      ),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.yellow,
      ),
      body: child,
    );
  }
}
