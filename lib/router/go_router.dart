import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/screens/bill_payment/add_money.dart';
import '/screens/service/service_page.dart';
import '/screens/bill_payment/bill_payment_home.dart';
import '/screens/settings/settings.dart';
import '/screens/error/error_page.dart';
import '/screens/home/homepage.dart';
import '/screens/profile/profile.dart';
import '/screens/index.dart';
import '/widgets/search_delegate.dart';
import '/models/service_model.dart';
import '/_helpers/config/config.dart';
import '/_helpers/extenstions.dart';
import '/_helpers/enums.dart';

class AppRouter {
  // AppRouter._();
  final _parentKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  final _shellKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter get router => _goRouter;

  final Offset defaultOffset = const Offset(0.0, 1.0);

  openSearchDelegate(context) {
    List<ServiceModel> services =
        serviceAvailabe.map((e) => ServiceModel.fromMap(e)).toList();
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(services),
    );
  }

  requestOpenSearchDelegate(context) {
    openSearchDelegate(context);
  }

  late final GoRouter _goRouter = GoRouter(
    navigatorKey: _parentKey,
    debugLogDiagnostics: true,
    initialLocation: SCREENS.billPaymentHome.toPath,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellKey,
        pageBuilder: (____, state, child) {
          print(state.matchedLocation.toString());
          return NoTransitionPage(
            child: Index(
              openSearchDelegate: openSearchDelegate,
              location: state.matchedLocation,
              child: child,
            ),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: SCREENS.billPaymentHome.toPath,
            name: SCREENS.billPaymentHome.toName,
            pageBuilder: (____, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const BillPaymentHome(),
              );
            },
            routes: <RouteBase>[
              // GoRoute(
              //   // parentNavigatorKey: _parentKey,
              //   path: SCREENS.addMoney.toPath,
              //   name: SCREENS.addMoney.toName,
              //   builder: (context, state) {
              //     return AddMoney(
              //       key: state.pageKey,
              //     );
              //   },
              // ),
            ],
          ),
          GoRoute(
            // parentNavigatorKey: _parentKey,
            path: SCREENS.addMoney.toPath,
            name: SCREENS.addMoney.toName,
            builder: (context, state) {
              return AddMoney(
                key: state.pageKey,
              );
            },
          ),
          GoRoute(
            path: SCREENS.taxServices.toPath,
            name: SCREENS.taxServices.toName,
            pageBuilder: (____, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: HomePage(
                  requestOpenSearchDelegate: requestOpenSearchDelegate,
                ),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                parentNavigatorKey: _parentKey,
                path: SCREENS.payment.toPath,
                name: SCREENS.payment.toName,
                builder: (context, state) {
                  // print(state.params);
                  return ServicePage(
                    key: state.pageKey,
                    serviceId: state.pathParameters["id"],
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: SCREENS.profile.toPath,
            name: SCREENS.profile.toName,
            pageBuilder: (____, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: Profile(
                  callback: () {},
                ),
              );
            },
          ),
          GoRoute(
            path: SCREENS.setting.toPath,
            name: SCREENS.setting.toName,
            pageBuilder: (____, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: Settings(),
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
    redirect: (context, state) {},
  );

  SlideTransition slideTransition(Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child, Offset? offset) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: offset ?? const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: offset ?? const Offset(0.0, 1.0),
        ).animate(secondaryAnimation),
        child: child,
      ),
    );
  }

  // PreferredSizeWidget getAppBar(String? path, BuildContext _) {
  //   return const CustomAppBar(leading: Text("Pixo"));
  // }
}
