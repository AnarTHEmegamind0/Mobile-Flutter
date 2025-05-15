import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/repositories/repo.dart';
import 'package:shop_app/services/HttpServices.dart';
import 'package:shop_app/widgets/CategoryFilter.dart';
import 'package:shop_app/widgets/UserGreeting.dart';
import '../widgets/ProductView.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  String selectedCategory = 'All';

  Future<List<ProductModel>> _getProductsData() async {
    List<ProductModel> data =
        await Provider.of<MyRepo>(context, listen: false).fetchProductData();

    if (data != null) {
      Provider.of<globalProvider>(context, listen: false).setProducts(data);
      return Provider.of<globalProvider>(context, listen: false).products;
    } else {
      return [];
    }
  }

  List<ProductModel> _filterProducts(List<ProductModel> products) {
    if (selectedCategory == 'All') {
      return products;
    }
    return products
        .where((product) => product.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<globalProvider>(context).currentUser;

    return SafeArea(
      child: FutureBuilder(
        future: _getProductsData(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final allProducts = snapshot.data!;
            final categories = [
              'All',
              ...allProducts.map((p) => p.category).whereType<String>().toSet(),
            ];
            final filteredProducts = _filterProducts(allProducts);

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: UserGreeting(user: user),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'home.bestQuality'.tr(),
                      style: GoogleFonts.exo2(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'home.onlyInShopApp'.tr(),
                      style: GoogleFonts.exo2(
                        fontSize: 18,
                        color: Colors.black26,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  CategoryFilter(
                    categories: categories,
                    selectedCategory: selectedCategory,
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                  // Grid of products
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                      children: List.generate(
                        filteredProducts.length,
                        (index) => ProductViewShop(filteredProducts[index]),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(),
              ),
            );
          }
        }),
      ),
    );
  }
}
