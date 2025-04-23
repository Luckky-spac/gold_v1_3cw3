import 'package:flutter/material.dart';
import 'package:gold_v1/service/auth_service.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  dynamic _userData;
  bool _success = false;

  // Getters
  bool get isLoading => _isLoading;
  dynamic get userData => _userData;
  bool get success => _success;

  final AuthService authService = AuthService();

  Future<void> register({
    required String username,
    required String userpassword,
    required String pinUser,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await authService.register(username: username, userpassword: userpassword, pinUser: pinUser);

      navService.goBack();

      if (result != null) {
        _userData = result;
        _success = true;
        
    
      } else {
        _success = false;
        
      }
    } catch (e) {
      navService.goBack();
      _success = false;
      
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
