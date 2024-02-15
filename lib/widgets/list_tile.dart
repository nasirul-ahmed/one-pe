import 'package:flutter/material.dart';
import '../_helpers/utils.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.child,
      required this.icon,
      required this.handleClick});
  final String child;
  final IconData icon;
  final VoidCallback handleClick;
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context)
        .textTheme
        .subtitle2!
        .copyWith(fontSize: 14, fontWeight: FontWeight.w600);
    return InkWell(
      onTap: () => handleClick(),
      child: Container(
        height: 48,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            space(20, 0),
            Icon(icon),
            space(50, 0),
            Text(
              child,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
