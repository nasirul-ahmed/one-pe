import '../../widgets/custom_button.dart';
import '/widgets/custom_header.dart';
import '/_helpers/image_constants.dart';
import '/_helpers/size_utils.dart';
import '/_helpers/themes/my_colors.dart';
import '/_helpers/utils.dart';
import '/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/theme_manager.dart';
import '/_helpers/miscText/misc_text.dart' show billPaymentHomeMiscText;

class BillAvialableServices extends StatelessWidget {
  final Function addMoney;
  const BillAvialableServices({super.key, required this.addMoney});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeMode = Provider.of<ThemeProvider>(context);
    Size screen = MediaQuery.of(context).size;
    final List<Widget> mobilRechargeWidgets = [
      buildIconButton(
        context,
        ImageIcon(
          AssetImage(
            ImageConstant.rechargeIcon,
          ),
          size: 30,
        ),
        billPaymentHomeMiscText["mobileRecharge"],
        themeMode,
        null,
      ),
      buildIconButton(
        context,
        const Icon(
          Icons.cell_tower,
          size: 30,
        ),
        billPaymentHomeMiscText["dth"],
        themeMode,
        null,
      ),
      buildIconButton(
        context,
        const Icon(
          Icons.lightbulb_outlined,
          size: 30,
        ),
        billPaymentHomeMiscText["electricityBill"],
        themeMode,
        null,
      ),
      buildIconButton(
        context,
        const Icon(
          Icons.car_crash_sharp,
          size: 30,
        ),
        billPaymentHomeMiscText["fastTag"],
        themeMode,
        null,
      ),
    ];
    return Container(
      child: Column(
        children: [
          // buildHeader(
          //   context,
          //   themeMode,
          //   billPaymentHomeMiscText["accountDetails"],
          //   Colors.blue.withOpacity(0.3),
          // ),

          CustomHeader2(
            bgColor: Colors.blue.withOpacity(0.3),
            title: billPaymentHomeMiscText["accountDetails"],
            padding: getPadding(left: 10),
          ),
          space(0, 10),
          CustomContainer(
            height: 80,
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                // buildIconButton(
                //   context,
                //   const Icon(
                //     Icons.add,
                //     size: 30,
                //   ),
                //   billPaymentHomeMiscText["addMoney"],
                //   themeMode,
                //   addMoney,
                // ),
                CustomIconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                  buttonText: billPaymentHomeMiscText["addMoney"],
                  onPressed: addMoney,
                ),
                buildIconButton(
                    context,
                    const Icon(
                      Icons.wallet,
                      size: 30,
                    ),
                    billPaymentHomeMiscText["wallet"],
                    themeMode,
                    null),
                buildIconButton(
                  context,
                  const Icon(
                    Icons.playlist_add_check_circle,
                    size: 30,
                  ),
                  billPaymentHomeMiscText["transaction"],
                  themeMode,
                  null,
                ),
              ],
            ),
          ),

          // refer and win
          space(0, 10),
          CustomContainer(
            height: 80,
            width: screen.width,
            color: themeMode.themeMode == ThemeMode.dark
                ? Colors.grey[900]
                : Colors.blue[50],
            borderRadius: BorderRadius.circular(9),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildReferral(
                    context,
                    themeMode,
                    ImageIcon(
                      AssetImage(
                        ImageConstant.referral,
                      ),
                      size: setHeight(20),
                    ),
                    "Reffer & Earn",
                    "₹25 Cashback",
                  ),
                  buildReferral(
                    context,
                    themeMode,
                    const Icon(
                      Icons.payment,
                      size: 20,
                    ),
                    "Pay More",
                    "Earn More",
                  ),
                ]),
          ),
          space(0, 10),
          // buildHeader(
          //   context,
          //   themeMode,
          //   billPaymentHomeMiscText["mobileRecharge"],
          //   MyColors.teal200.withOpacity(.4),
          // ),
          CustomHeader2(
            bgColor: MyColors.teal200.withOpacity(.4),
            title: billPaymentHomeMiscText["mobileRecharge"],
            padding: getPadding(left: 10),
          ),
          space(0, 10),
          CustomContainer(
            height: setHeight(300),
            width: screen.width,
            borderRadius: BorderRadius.circular(8),
            child: Wrap(
              direction: Axis.horizontal,
              runSpacing: 10,
              spacing: 0,
              children: List.generate(
                mobilRechargeWidgets.length,
                (index) => mobilRechargeWidgets[index],
              ),
            ),
          ),

          space(0, 50)

          // CustomContainer(height: 300, borderRadius: borderRadius)
        ],
      ),
    );
  }

  Widget buildIconButton(BuildContext ctx, Widget icon, String title,
      ThemeProvider themeMode, Function? onPressed) {
    return MaterialButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: CustomContainer(
        height: setHeight(100),
        width: setWidth(87),
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Container(
              alignment: Alignment.center,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(ctx).textTheme.bodySmall!.copyWith(
                      fontSize: 11,
                      color: themeMode.themeMode == ThemeMode.dark
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context, ThemeProvider themeMode,
      String title, Color color) {
    return CustomContainer(
      color:
          themeMode.themeMode == ThemeMode.dark ? color.withOpacity(.6) : color,
      height: setHeight(30),
      borderRadius: BorderRadius.circular(8),
      padding: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: themeMode.themeMode == ThemeMode.dark
                      ? Colors.white
                      : Colors.black,
                ),
          ),
        ],
      ),
    );
  }

  Widget buildReferral(BuildContext context, ThemeProvider themeMode,
      Widget icon, String text1, String text2) {
    return CustomContainer(
      color: themeMode.themeMode == ThemeMode.dark
          ? Colors.grey[700]
          : Colors.white,
      height: setHeight(70),
      width: MediaQuery.of(context).size.width / 2 - 10,
      borderRadius: BorderRadius.circular(8),
      child: Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: setHeight(35),
                  width: setWidth(35),
                  padding: getPadding(all: 7),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: icon,
                ),
                space(10, 0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text1,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                    ),
                    Text(
                      text2,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
