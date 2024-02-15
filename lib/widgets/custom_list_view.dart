import 'package:flutter/material.dart';
import '../_helpers/utils.dart';

class CustomListView extends StatelessWidget {
  final Widget? header;
  final Widget Function(int) listItemBuilder;
  final Widget separator;
  final int itemCount;
  final Axis? scrollDirection;
  const CustomListView({
    super.key,
    this.header,
    required this.listItemBuilder,
    required this.separator,
    required this.itemCount,
    this.scrollDirection,
  });

  @override
  Widget build(BuildContext context) {
    if (header == null) {
      return ListView.separated(
        shrinkWrap: true,
        scrollDirection: scrollDirection ?? Axis.vertical,
        itemBuilder: (_, index) => listItemBuilder(index),
        separatorBuilder: (_, index) => separator,
        itemCount: itemCount,
      );
    } else {
      return Column(
        children: [
          header!,
          space(0, 20),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: scrollDirection ?? Axis.vertical,
              itemBuilder: (_, index) => listItemBuilder(index),
              separatorBuilder: (_, index) => separator,
              itemCount: itemCount,
            ),
          ),
        ],
      );
    }
  }
}
