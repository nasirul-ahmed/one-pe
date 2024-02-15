import 'package:flutter/material.dart';
import 'package:onepe/_helpers/size_utils.dart';

class CustomFullScreenDialog extends StatelessWidget {
  final Widget? child;
  final String? headerText;
  final bool? automaticallyImplyLeading;
  final bool? centerTitle;
  final double? padding;
  const CustomFullScreenDialog({
    super.key,
    this.child,
    this.headerText,
    this.automaticallyImplyLeading,
    this.centerTitle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading ?? false,
          title: Text(
            headerText ?? 'Full-screen dialog',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: centerTitle ?? true,
          actions: [
            TextButton(
              child: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        body: Container(
          padding: getPadding(left: 20, right: 20),
          child: child ?? const SizedBox(),
        ),
      ),
    );
  }
}
