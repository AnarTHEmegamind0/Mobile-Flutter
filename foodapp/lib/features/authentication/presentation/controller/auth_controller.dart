import 'package:flutter/material.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/models/user_model.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository _repository;
  UserModel? _user;
  bool _isLoading = false;
  String? _errorMessage;

  AuthController(this._repository) {
    _user = _repository.getCurrentUser();
  }

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _repository.isLoggedIn();

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await _repository.login(email, password);
      _isLoading = false;

      if (user != null) {
        _user = user;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Invalid email or password';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'An error occurred. Please try again.';
      notifyListeners();
      return false;
    }
  }
}
