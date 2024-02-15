import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final String? error;
  const ErrorPage({super.key, this.error});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(widget.error ?? "Something went wrong"),
        ),
      ),
    );
  }
}
