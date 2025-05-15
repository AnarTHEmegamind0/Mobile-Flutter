import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/carts.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/models/users.dart';
import 'package:shop_app/repositories/repo.dart';

class globalProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  int productId = 0;
  List<CartModel> carts = [];
  List<ProductModel> cartItems = [];
  List<ProductModel> favoriteItems = [];
  int currentIdx = 0;
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;
  int userId = 0;
  // List<CartModel> get carts => cartItems.cast<CartModel>();

  void setProducts(List<ProductModel> data) {
    products = data;
    notifyListeners();
  }

  void changeCurrentIdx(int idx) {
    currentIdx = idx;
    notifyListeners();
  }

  void setCartItems(List<ProductModel> data) {
    cartItems = data;
    notifyListeners();
  }

  void setCarts(List<CartModel> data) {
    carts = data;
    notifyListeners();
  }

  void removeFromCart(ProductModel item) {
    cartItems.remove(item);
    notifyListeners();
  }

  bool isInCart(ProductModel product) {
    return cartItems.any((item) => item.id == product.id);
  }

  void toggleCartItem(BuildContext context, ProductModel product) async {
    if (isInCart(product)) {
      cartItems.removeWhere((item) => item.id == product.id);

      int productId = product.id!;
      final response = await Provider.of<MyRepo>(context, listen: false)
          .addSingleProduct(productId, product);

      if (response != null) {
        print("Successfully sent product: ${response.title}");
      } else {
        print("Failed to send product");
      }
    } else {
      cartItems.add(product);
    }
    notifyListeners();
  }


  bool isFavorite(ProductModel product) {
    return favoriteItems.any((item) => item.id == product.id);
  }

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product)) {
      favoriteItems.removeWhere((item) => item.id == product.id);
    } else {
      favoriteItems.add(product);
    }
    notifyListeners();
  }

  void loginUser(UserModel user) {
    _currentUser = user;
    userId = user.id ?? 0;
    print(userId);
    notifyListeners();
  }

  void logoutUser() {
    _currentUser = null;
    userId = 0;
    cartItems.clear();
    favoriteItems.clear();
    products.clear();
    carts.clear();
    currentIdx = 0;
    notifyListeners();
  }

  bool get isLoggedIn => _currentUser != null;
}
