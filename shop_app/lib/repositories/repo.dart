import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/carts.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/models/users.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/services/HttpServices.dart';

class MyRepo {
  final HttpServices httpService;

  MyRepo({required this.httpService, optional});

  // product fetchleh function
  Future<List<ProductModel>> fetchProductData() async {
    try {
      dynamic jsonData = await httpService.getData('products', null);
      List<ProductModel> data = ProductModel.fromList(jsonData);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print("Error loading products: $e");
      }
      return [];
    }
  }

  Future<List<CartModel>> fetchCartData() async {
    try {
      dynamic jsonData = await httpService.getData('carts', null);
      List<CartModel> data = CartModel.fromList(jsonData);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print("Error loading carts: $e");
      }
      return [];
    }
  }

  Future<List<ProductModel>> getCartItems(
    BuildContext context,
    List<CartModel> items,
  ) async {
    try {
      final userId = Provider.of<globalProvider>(context, listen: false).userId;

      // Filter cart items belonging to the current user
      final filteredCarts =
          items.where((item) => item.userId == userId).toList();
      print( "Filtered carts: $filteredCarts");

      List<ProductModel> allProducts = [];

      for (var cart in filteredCarts) {
        for (var cartProduct in cart.products ?? []) {
          // Fetch product info using the productId
          ProductModel? product = await fetchProductById(
            cartProduct.productId!,
          );

          if (product != null) {
            // Duplicate product by quantity
            for (int i = 0; i < (cartProduct.quantity ?? 1); i++) {
              allProducts.add(product);
            }
          }
        }
      }
      print("All products: $allProducts");
      return allProducts;
    } catch (e) {
      print("Error loading carts: $e");
      return [];
    }
  }

  // users fetchleh function
  Future<UserModel?> fetchSingleUserData(int userId) async {
    try {
      dynamic jsonData = await httpService.getData('users/$userId', null);
      return UserModel.fromJson(jsonData);
    } catch (e) {
      if (kDebugMode) {
        print("Error loading user: $e");
      }
      return null;
    }
  }

  // login hiih function
  Future<String> login(String username, String password) async {
    try {
      dynamic data = {'username': username, 'password': password};
      dynamic jsonData = await httpService.postData('auth/login', data, null);
      return jsonData['token'];
    } catch (e) {
      if (kDebugMode) {
        print("Error logging in: $e");
      }
      return '';
    }
  }

  Future<ProductModel?> fetchProductById(int id) async {
    try {
      final jsonData = await httpService.getData('products/${id}', null);
      return ProductModel.fromJson(jsonData);
    } catch (e) {
      print("Error fetching product $id: $e");
      return null;
    }
  }
    
  Future<ProductModel?> addSingleProduct(int id, ProductModel product) async {
    try {
      final data = {
        "id": id,
        "title": product.title,
        "price": product.price,
        "description": product.description,
        "category": product.category,
        "image": product.image,
      };

      final jsonData = await httpService.postData('products', data, null);
      print("POST response: $jsonData");

      return ProductModel.fromJson(jsonData);
    } catch (e) {
      print("Error adding product $id: $e");
      return null;
    }
  }


}
