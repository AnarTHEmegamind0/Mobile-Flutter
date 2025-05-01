import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/models/products.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  Future<List<ProductModel>> _getData() async {
    String res = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/products.json');
    return ProductModel().fromList(jsonDecode(res));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for data
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle errors gracefully
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          // Display the data when available
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text('Shopping Page'),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].title!),
                      subtitle: Text(snapshot.data![index].description!),
                      trailing: Text('\$${snapshot.data![index].price}'),
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          // Handle the case where the data is empty
          return const Center(child: Text('No products available.'));
        }
      },
    );
  }
}
