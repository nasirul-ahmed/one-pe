import 'package:flutter/material.dart';
import '../../_helpers/utils.dart';
import '../../widgets/simple_textfield.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Sign Up"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email"),
                    space(0, 8),
                    Container(
                      child: SimpleTextField(
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        validate: () {},
                      ),
                    ),
                    space(0, 12),
                    const Text("Password"),
                    space(0, 8),
                    Container(
                      child: Column(
                        children: [
                          SimpleTextField(
                            type: TextInputType.visiblePassword,
                            controller: passwordController,
                            validate: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            space(0, 20),
            Container(
              height: 40,
              width: 150,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
