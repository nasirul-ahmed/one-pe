import 'package:flutter/material.dart';
import 'component_decoration.dart';

class Dialogs extends StatefulWidget {
  final bool? isFullScreen;
  const Dialogs({super.key, this.isFullScreen});

  @override
  State<Dialogs> createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
  void openDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('What is a dialog?'),
        content: const Text(
            'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Dismiss'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FilledButton(
            child: const Text('Okay'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void openFullscreenDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Full-screen dialog'),
              centerTitle: false,
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                TextButton(
                  child: const Text('Close'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Dialog',
      tooltipMessage:
          'Use showDialog with Dialog.fullscreen, AlertDialog, or SimpleDialog',
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          TextButton(
            child: const Text(
              'Show dialog',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (widget.isFullScreen != null) {
                openFullscreenDialog(context);
              } else
                openDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
