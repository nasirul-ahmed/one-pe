import 'package:onepe/screens/termsandconditions/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import '../../_helpers/image_constants.dart';
import '../../_helpers/size_utils.dart';
import '../../_helpers/themes/my_colors.dart';
import '../../_helpers/utils.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_fullscreen_dialog.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/custom_switch.dart';
import '../../widgets/drawer_list_item.dart';
import '../../_helpers/miscText/misc_text.dart' show profileMiscText;
import '../termsandconditions/faq.dart';

class Profile extends StatefulWidget {
  final VoidCallback callback;
  const Profile({super.key, required this.callback});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isNotificationOn = true;
  bool isAppLockOn = false;

  toggle(bool v, String type) {
    if (type == "isNotificationOn") {
      setState(() {
        isNotificationOn = v;
      });
    } else if (type == "isAppLockOn") {
      setState(() {
        isAppLockOn = v;
      });
    }
  }

  List<Widget> buildButtons(List<String> btns) {
    return List.generate(
      btns.length,
      (idx) => Padding(
        padding: getPadding(
          top: 8,
          bottom: 10,
          left: idx == 0 ? 10 : 4,
          right: idx == btns.length - 1 ? 10 : 4,
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(btns[idx]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var buttons = ["Orders", "Transactions", "Add money", "Profit"];
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: deviceheight,
        width: deviceWidth,
        child: ListView(
          shrinkWrap: true,
          children: [
            CustomHeader(
              title: profileMiscText["userDetailsMiscText"],
              divider: true,
            ),
            Container(
              padding: getPadding(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CustomCard(
                        height: 70,
                        width: 70,
                        borderRadius: 18,
                        bgColor: MyColors.transparant,
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(ImageConstant.girlAvatar),
                        ),
                      ),
                      space(10, 0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UserName",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: setHeight(24),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Noto Sans",
                                    ),
                          ),
                          Text(
                            "example@gmail.com",
                            maxLines: 1,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: setHeight(17),
                                  fontFamily: "Source Sans Pro",
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
            ),
            space(0, 10),
            DrawerListItem(
              padding: getPadding(all: 20),
              icon: Icons.list,
              onClick: () {},
              title: profileMiscText["profitMiscText"],
              trailing: Icons.arrow_forward_ios_outlined,
              fontSize: 16,
            ),
            DrawerListItem(
              padding: getPadding(all: 20),
              icon: Icons.history,
              onClick: () {},
              title: profileMiscText["walletHistory"],
              fontSize: 16,
              trailing: Icons.arrow_forward_ios_outlined,
            ),
            CustomHeader(
              title: profileMiscText["settingsMiscText"],
              divider: true,
            ),
            Container(
              height: setHeight(60),
              padding: getPadding(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        isNotificationOn
                            ? Icons.notifications_active
                            : Icons.notifications_off_outlined,
                      ),
                      space(10, 0),
                      Text(
                        "Notification",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: setWidth(16),
                            ),
                      ),
                    ],
                  ),
                  CustomSwitch(
                    isEnabled: isNotificationOn,
                    onChange: (v) => toggle(v, "isNotificationOn"),
                  ),
                ],
              ),
            ),
            Container(
              height: setHeight(60),
              padding: getPadding(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        isAppLockOn ? Icons.lock : Icons.lock_open_rounded,
                      ),
                      space(10, 0),
                      Text(
                        "App Lock",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: setWidth(16),
                            ),
                      )
                    ],
                  ),
                  CustomSwitch(
                    isEnabled: isAppLockOn,
                    onChange: (v) => toggle(v, "isAppLockOn"),
                  ),
                ],
              ),
            ),
            DrawerListItem(
              padding: getPadding(all: 20),
              icon: Icons.connect_without_contact,
              onClick: () {},
              title: profileMiscText["contactUs"],
              trailing: Icons.arrow_forward_ios_outlined,
            ),
            DrawerListItem(
              padding: getPadding(all: 20),
              icon: Icons.record_voice_over_sharp,
              onClick: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, t1, t2) =>
                      const CustomFullScreenDialog(
                    headerText: "FAQs",
                    child: FAQ(),
                  ),
                );
              },
              title: "FAQ",
              trailing: Icons.arrow_forward_ios_outlined,
            ),
            DrawerListItem(
              padding: getPadding(all: 20),
              icon: Icons.chrome_reader_mode,
              onClick: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, t1, t2) =>
                      const CustomFullScreenDialog(
                    headerText: "Terms & Conditions",
                    child: TermsAndConditions(),
                  ),
                );
              },
              title: "Terms & Conditions",
              trailing: Icons.arrow_forward_ios_outlined,
            ),
            space(0, 50)
          ],
        ),
      ),
    );
  }
}
