// import 'package:charity_circle/models/auth_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AuthProvider with ChangeNotifier {
//  final AuthModel _authModel = AuthModel(
//     name: "",
//     email: "",
//     type: "",
//   );

//   Future<void> addUserData() async{
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     firebaseFirestore.collection("Users").doc().get();
//     notifyListeners();
//   }

//   AuthModel get authModel => _authModel;
// }
