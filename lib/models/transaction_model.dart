// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../_helpers/enums.dart';

class TransactionModel {
  final String txId;
  final String desc;
  final TransactionType type;
  final double amount;
  TransactionModel({
    required this.txId,
    required this.desc,
    required this.type,
    required this.amount,
  });
}
