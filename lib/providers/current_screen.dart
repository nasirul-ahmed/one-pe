import '/_helpers/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../_helpers/enums.dart';

class CurrentScreen with ChangeNotifier {
  int index = 0;

  get getIndex => index;

  locationToTabIndex(BuildContext context) {
    final String? location = GoRouterState.of(context).path;
    if (location!.startsWith(SCREENS.profile.toPath)) {
      index = 1;
    } else if (location.startsWith(SCREENS.setting.toPath)) {
      index = 2;
    } else {
      index = 0;
    }
    notifyListeners();
  }
}
