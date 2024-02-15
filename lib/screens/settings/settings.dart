import 'package:onepe/screens/termsandconditions/faq.dart';
import 'package:onepe/widgets/custom_fullscreen_dialog.dart';

import '../../widgets/custom_container.dart';

import '../../widgets/custom_switch.dart';
import '/_helpers/utils.dart';
import '/widgets/custom_header.dart';
import 'package:flutter/material.dart';

import '../../_helpers/size_utils.dart';
import '../../widgets/drawer_list_item.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isNotificationOn = true;
  bool isAppLockOn = false;
  toggleNotification(v) {
    setState(() {
      isNotificationOn = v;
    });
  }

  toggleAppLock(v) {
    setState(() {
      isAppLockOn = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: deviceheight,
        width: deviceWidth,
        child: ListView(
          children: [
            const CustomHeader(
              title: "Settings",
              divider: true,
            ),
            Container(
              height: 60,
              padding: getPadding(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notification",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: setWidth(18),
                        ),
                  ),
                  CustomSwitch(
                    isEnabled: isNotificationOn,
                    onChange: toggleNotification,
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              padding: getPadding(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "App Lock",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: setWidth(18),
                        ),
                  ),
                  CustomSwitch(
                    isEnabled: isAppLockOn,
                    onChange: toggleAppLock,
                  ),
                ],
              ),
            ),
            DrawerListItem(
              padding: getPadding(all: 20),
              icon: Icons.record_voice_over_sharp,
              onClick: () {},
              title: "FAQ",
              trailing: Icons.arrow_forward_ios_outlined,
            ),
            DrawerListItem(
              padding: getPadding(all: 20),
              icon: Icons.chrome_reader_mode,
              onClick: () {},
              title: "Terms & Conditions",
              trailing: Icons.arrow_forward_ios_outlined,
            ),
            space(0, 100),
            const Center(child: Text("All rights reserved @2023"))
          ],
        ),
      ),
    );
  }
}
