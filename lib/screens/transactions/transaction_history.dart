import '/_helpers/themes/my_colors.dart';
import '/_helpers/utils.dart';
import '/widgets/custom_card.dart';
import '/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
      ),
      body: CustomListView(
        listItemBuilder: (index) {
          return CustomCard(
            height: 100,
            width: double.infinity,
            child: Container(
              color: MyColors.cyanA100Cc,
              child: const SizedBox(),
            ),
          );
        },
        separator: divider(1, null),
        itemCount: 10,
      ),
    );
  }
}
