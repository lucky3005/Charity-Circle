import 'dart:math';

class AuthModel {
  final String name;
  final String email;
  final String password;
  final String type;
  final String uid;

  AuthModel({
    required this.name,
    required this.email,
    this.password = "",
    required this.type,
    this.uid = "",
  });
  
   // Convert Firestore document to model
  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
        name: map["name"],
        email: map["email"],
        password: map["password"],
        type: map["type"],
        uid: map["uid"]);
  }
  
  // Convert model to Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "type": type,
      "uid": uid,
    };
  }
}
