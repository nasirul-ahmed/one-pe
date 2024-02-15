import 'package:flutter/material.dart';
import '../_helpers/utils.dart';
import '../screens/profile/profile.dart';
import '../services/auth_services.dart';
import 'list_tile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontSize: 14, fontWeight: FontWeight.w600);
    var style2 = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontSize: 12, fontWeight: FontWeight.w500);
    return Drawer(
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Profile(
                          callback: () {},
                        ),
                      ),
                    )
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images/person.png"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Easy Tax",
                              style: style,
                            ),
                            Text(
                              "easyurtax@gmail.com",
                              style: style,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              DrawerListTile(
                child: "Applications",
                icon: Icons.history,
                handleClick: () {},
              ),
              DrawerListTile(
                child: "Log Out",
                icon: Icons.logout,
                handleClick: () {
                  signOut(context);
                },
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text("@easy_ur_tax"),
          ),
          space(0, 20),
        ],
      ),
    );
  }
}
