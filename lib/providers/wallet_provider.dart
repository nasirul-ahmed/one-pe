import '/models/transaction_model.dart';
import 'package:flutter/material.dart';

class Wallet extends ChangeNotifier {
  double balance = 1000.0;
  List<TransactionModel> transactions = [];

  Future<void> addFunds(double amount) async {
    Future.delayed(
        const Duration(seconds: 2)); // remove this and add api call here
    balance += amount;

    notifyListeners();
  }
}
