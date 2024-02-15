import '/widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../_helpers/extenstions.dart';
import '../_helpers/enums.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_bar.dart';
import '../widgets/custom_bottom_nav_bar_item.dart';
import '../widgets/custom_drawer.dart';

class Index extends StatefulWidget {
  final Function(dynamic) openSearchDelegate;
  final String? location;
  final Widget child;
  final PreferredSizeWidget? appBar;
  const Index({
    super.key,
    required this.child,
    this.location,
    this.appBar,
    required this.openSearchDelegate,
  });
  @override
  State<Index> createState() => IndexState();
}

class IndexState extends State<Index> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey(debugLabel: "Index gKey");
  bool isLoading = true;

  // late List<Widget> pages;

  List<CustomBottomNavBarItem> tabs = [
    CustomBottomNavBarItem(
      initialLocation: SCREENS.billPaymentHome.toPath,
      icon: Icons.home,
    ),
    CustomBottomNavBarItem(
      initialLocation: SCREENS.taxServices.toPath,
      icon: Icons.widgets_rounded,
    ),
    CustomBottomNavBarItem(
      initialLocation: SCREENS.profile.toPath,
      icon: Icons.person,
    ),
  ];

  static int _locationToTabIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(SCREENS.billPaymentHome.toPath)) {
      return 0;
    }
    if (location.startsWith(SCREENS.taxServices.toPath)) {
      return 1;
    }
    if (location.startsWith(SCREENS.profile.toPath)) {
      return 2;
    }
    return 0;
  }

  _onTapItem(BuildContext _, int index) {
    var router = GoRouter.of(_);
    switch (index) {
      case 0:
        router.go(SCREENS.billPaymentHome.toPath);
        break;
      case 1:
        router.go(SCREENS.taxServices.toPath);
        break;
      case 2:
        router.go(SCREENS.profile.toPath);
        break;
      default:
        break;
    }
  }

  openDrawer() {
    _key.currentState!.openDrawer();
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("index loaded");
    print(_locationToTabIndex(context));

    return isLoading
        ? const CustomLoader(
            color: Colors.green,
            size: 50.0,
          )
        : Scaffold(
            key: _key,
            extendBodyBehindAppBar: false,
            // drawer: CustomDrawer(
            //   handleBack: () => _key.currentState?.closeDrawer(),
            // ),
            appBar: CustomAppBar(
              openDrawer: () => _key.currentState!.openDrawer(),
              openSearchDelegate: widget.openSearchDelegate,
            ),
            body: widget.child,
            bottomNavigationBar: CustomBottomBar(
              currentIndex: _locationToTabIndex(context), // currentScreen,
              items: tabs,
              onClick: (_, idx) => _onTapItem(_, idx),
            ),
          );
  }
}
