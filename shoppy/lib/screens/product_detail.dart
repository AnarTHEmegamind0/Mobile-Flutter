import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/provider/globalProvider.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  const ProductDetail(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<globalProvider>(
      builder: (context, provider, child) {
        bool isInCart = provider.isInCart(product);
        bool isFav = provider.isFavorite(product);

        return Scaffold(
          appBar: AppBar(
            title: Text('shopping.product.detailsa'.tr()),
            actions: [
              IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : Colors.grey,
                ),
                onPressed: () => provider.toggleFavorite(product),
              ),
            ],
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image with Hero & overlay
                Stack(
                  children: [
                    Hero(
                      tag: product.image ?? '',
                      child: Image.network(
                        product.image ?? '',
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Product Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    product.title ?? '',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    product.description ?? 'common.noDescription'.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),

          // Add to Cart Button
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: isInCart ? Colors.grey : Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(
                isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
                color: Colors.white,
              ),
              label: Text(
                isInCart
                    ? 'shopping.product.removeFromCart'.tr()
                    : 'shopping.product.addToCart'.tr(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                provider.toggleCartItem(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isInCart
                          ? 'cart.removedFromCart'.tr()
                          : 'cart.addedToCart'.tr(),
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
