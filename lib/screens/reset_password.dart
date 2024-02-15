import 'package:flutter/material.dart';
import '../_helpers/utils.dart';
import '../widgets/simple_textfield.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset your password",
              style: style.subtitle1!.copyWith(fontWeight: FontWeight.w600),
            ),
            space(0, 10),
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                "Email",
                style: style.subtitle2!.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            space(0, 8),
            SimpleTextField(
              type: TextInputType.text,
              controller: controller,
              validate: () {},
            ),
            space(0, 20),
            Center(
              child: Container(
                height: 48,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: style.subtitle2!.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
