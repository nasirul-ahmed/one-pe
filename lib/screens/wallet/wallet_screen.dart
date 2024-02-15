import '/_helpers/size_utils.dart';
import '/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(all: 20),
      child: const Column(
        children: [
          Card(
            elevation: 3,
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  Text("Wallet Balance"),
                  Text("Wallet Balance"),
                ],
              ),
            ),
          ),
          CustomHeader(
            title: "Payment History",
            divider: false,
          ),
        ],
      ),
    );
  }
}
