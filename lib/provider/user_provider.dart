import 'package:charity_circle/models/auth_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  AuthModel _authModel = AuthModel(
    name: "",
    email: "",
    type: "",
  );

  AuthModel get getUser => _authModel;

  void setUser(user) {
    _authModel = AuthModel.fromMap(user);
    notifyListeners();
  }
}
