import 'package:flutter/material.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';
import '../../../../core/constants/image_constants.dart';

class AuthRepositoryImpl implements AuthRepository {
  // Mock user for demo purposes
  UserModel? _currentUser;

  @override
  Future<UserModel?> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simple mock validation
    if (email.isNotEmpty && password.isNotEmpty) {
      _currentUser = UserModel(
        id: '1',
        name: 'Test User',
        email: email,
        imageProvider: const NetworkImage(ImageConstants.defaultAvatar),
      );
      return _currentUser;
    }
    return null;
  }

  @override
  UserModel? getCurrentUser() {
    return _currentUser;
  }

  @override
  bool isLoggedIn() {
    return _currentUser != null;
  }
}
