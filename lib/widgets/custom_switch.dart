import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool isEnabled;
  final Function onChange;
  const CustomSwitch(
      {super.key, required this.isEnabled, required this.onChange});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  // bool value1 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }
    return const Icon(Icons.close);
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
        thumbIcon: thumbIcon,
        value: widget.isEnabled,
        onChanged: (v) => widget.onChange(v));
  }
}
