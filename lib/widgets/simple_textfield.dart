import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({
    super.key,
    required this.type,
    required this.controller,
    required this.validate,
  });

  final TextInputType type;
  final TextEditingController controller;
  final Function validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (v) => validate(v),
      keyboardType: type,
      controller: controller,
      style: const TextStyle(),
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
