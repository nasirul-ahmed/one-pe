import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '_helpers/config/config.dart';
import 'providers/current_screen.dart';
import 'providers/secure_storage.dart';
import 'providers/service_provider.dart';
import 'providers/store.dart';
import 'providers/theme_manager.dart';
import 'router/go_router.dart';
import '/_helpers/themes/themes.dart';

Future<void> initDependency() async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  initDependency();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late List<SingleChildWidget> providers;
  ThemeMode themeMode = ThemeMode.system;
  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        return View.of(context).platformDispatcher.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  void initState() {
    providers = [
      ChangeNotifierProvider(create: (_) => SecureStorageProvider()),
      ChangeNotifierProvider<Store>(create: (_) => Store()),
      ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ChangeNotifierProvider<CurrentScreen>(create: (_) => CurrentScreen()),
      Provider<AppRouter>(create: (_) => AppRouter()),
      Provider<ServiceProvider>(
        create: (_) => ServiceProvider(serviceAvailabe),
      ),
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Builder(
        builder: (_) {
          final GoRouter goRouter =
              Provider.of<AppRouter>(_, listen: false).router;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'App',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: Provider.of<ThemeProvider>(_).themeMode,
            routerDelegate: goRouter.routerDelegate,
            routeInformationParser: goRouter.routeInformationParser,
            routeInformationProvider: goRouter.routeInformationProvider,
          );
        },
      ),
    );
  }
}
