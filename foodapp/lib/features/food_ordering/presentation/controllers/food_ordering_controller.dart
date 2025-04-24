import 'package:flutter/material.dart';
import '../../data/models/customer_model.dart';
import '../../data/models/item_model.dart';
import '../../domain/repositories/food_repository.dart';
import '../../../authentication/data/models/user_model.dart';

class FoodOrderingController extends ChangeNotifier {
  final FoodRepository _repository;
  final UserModel _user;
  
  FoodOrderingController(this._repository, this._user) {
    _loadData();
  }
  
  late List<ItemModel> menuItems;
  late CustomerModel customer;
  final GlobalKey draggableKey = GlobalKey();
  
  void _loadData() {
    menuItems = _repository.getMenuItems();
    customer = _repository.createCustomerFromUser(_user);
  }
  
  void addItemToCustomerCart(ItemModel item) {
    customer.items.add(item);
    notifyListeners();
  }
  
  void removeItemFromCart(int index) {
    if (index >= 0 && index < customer.items.length) {
      customer.items.removeAt(index);
      notifyListeners();
    }
  }
  
  void clearCart() {
    customer.items.clear();
    notifyListeners();
  }
}