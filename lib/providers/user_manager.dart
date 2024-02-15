import 'package:flutter/cupertino.dart';

class UserManager with ChangeNotifier {
  User? user;

  get getuser => user;

  updateUser(User? _) {
    user = _;
    notifyListeners();
  }
}

class User {
  final String name;
  final String email;
  final String token;

  User(this.name, this.email, this.token);
}
