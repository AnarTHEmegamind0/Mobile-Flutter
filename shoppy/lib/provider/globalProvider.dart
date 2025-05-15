import 'package:flutter/material.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/models/users.dart';

class globalProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> cartItems = [];
  List<ProductModel> favoriteItems = [];
  int currentIdx = 0;

  void setProducts(List<ProductModel> data) {
    products = data;
    notifyListeners();
  }

  void changeCurrentIdx(int idx) {
    currentIdx = idx;
    notifyListeners();
  }

  void removeFromCart(ProductModel item) {
    cartItems.remove(item);
    notifyListeners();
  }


  bool isInCart(ProductModel product) {
    return cartItems.any((item) => item.id == product.id);
  }

  bool isFavorite(ProductModel product) {
    return favoriteItems.any((item) => item.id == product.id);
  }

  void toggleCartItem(ProductModel product) {
    if (isInCart(product)) {
      cartItems.removeWhere((item) => item.id == product.id);
    } else {
      cartItems.add(product);
    }
    notifyListeners();
  }

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product)) {
      favoriteItems.removeWhere((item) => item.id == product.id);
    } else {
      favoriteItems.add(product);
    }
    notifyListeners();
  }

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  void loginUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }

  void logoutUser() {
    _currentUser = null;
    notifyListeners();
  }

  bool get isLoggedIn => _currentUser != null;

}
