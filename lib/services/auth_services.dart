import 'package:provider/provider.dart';

import '../providers/user_manager.dart';

Future<User> emailSignIn(String email, String password) async {
  return User(email, password, email + password);
}

Future<User> mobileSignIn(String mobile) async {
  return User("", "", mobile);
}

verifyOTP(int otp) {}

void signUp(doc) {}

void signOut(context) {
  Provider.of<UserManager>(context, listen: false).updateUser(null);
}
