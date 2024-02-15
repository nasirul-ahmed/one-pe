import '/providers/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../_helpers/image_constants.dart';
import '../_helpers/size_utils.dart';
import '../_helpers/themes/my_colors.dart';
import '../_helpers/utils.dart';
import 'custom_card.dart';
import 'drawer_list_item.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback handleBack;
  CustomDrawer({super.key, required this.handleBack});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // var textTheme = Theme.of(context).textTheme;
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      body: Container(
        padding: getPadding(
          left: 25,
          right: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            space(0, 73),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => handleBack(),
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ),
            space(0, 18),
            SizedBox(
              height: setHeight(98),
              width: setWidth(339),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomCard(
                    height: 91,
                    width: 91,
                    borderRadius: 18,
                    bgColor: MyColors.transparant,
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage(ImageConstant.girlAvatar),
                    ),
                  ),
                  space(20, 0),
                  SizedBox(
                    width: setWidth(222),
                    height: setHeight(91),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome,",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: setHeight(18),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Noto Sans",
                                  ),
                        ),
                        Text(
                          "Nasir Ahmed",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: setHeight(32),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Noto Sans",
                                  ),
                          maxLines: 1,
                        ),
                        Text(
                          "nasir369@gmail.com",
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: setHeight(17),
                                    fontFamily: "Source Sans Pro",
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            space(0, 50),
            Container(
              width: setWidth(340),
              height: setHeight(2),
              color: isDarkTheme ? MyColors.dividerDark : MyColors.dividerlight,
            ),
            space(0, 52),
            SizedBox(
              height: setHeight(222),
              width: setWidth(340),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DrawerListItem(
                    icon: Icons.person_3_outlined,
                    onClick: () {},
                    title: "Profile",
                  ),
                  DrawerListItem(
                    icon: Icons.wallet_giftcard_outlined,
                    onClick: () {},
                    title: "Wallet",
                  ),
                  DrawerListItem(
                    icon: Icons.money_rounded,
                    onClick: () {},
                    title: "Add Cash",
                  ),
                  DrawerListItem(
                      icon: Icons.attach_money,
                      onClick: () {},
                      title: "Refer and Earn",
                      trailing: Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
            space(0, 81),
            Container(
              width: setWidth(340),
              height: setHeight(2),
              color: isDarkTheme ? MyColors.dividerDark : MyColors.dividerlight,
            ),
            space(0, 80),
            SizedBox(
              height: setHeight(90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DrawerListItem(
                    icon: Icons.power_settings_new_sharp,
                    onClick: () {},
                    title: "Log Out",
                  ),
                  Text(
                    "developed by r369",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(letterSpacing: 1.2, fontSize: 10),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
