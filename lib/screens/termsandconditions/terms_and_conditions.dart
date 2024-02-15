import 'package:flutter/material.dart';

import '../../_helpers/utils.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        generateRandomString(5000),
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
