import 'dart:convert';
import '../_helpers/enums.dart';

class User {
  final String userId;
  final String name;
  final Role role;
  final String email;
  final String phone;

  User(
      {required this.userId,
      required this.name,
      required this.role,
      required this.email,
      required this.phone});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'name': name,
      'role': role,
    };
  }

  static Role toRole(String role) {
    switch (role.toUpperCase()) {
      case "b2b":
        return Role.b2b;
      default:
        return Role.customer;
    }
  }

  static String fromRole(Role role) {
    switch (role) {
      case Role.b2b:
        return "b2b";
      default:
        return "customer";
    }
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'],
      name: map['name'],
      email: map["email"],
      phone: map["phone"],
      role: toRole(
        map['role'],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
