import 'package:flutter/foundation.dart';

class UserState with ChangeNotifier {
  bool _isAdmin = false;

  bool get isAdmin => _isAdmin;

  void setIsAdmin(bool value) {
    _isAdmin = value;
    notifyListeners();
  }
}
