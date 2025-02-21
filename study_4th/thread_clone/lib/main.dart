import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thread_clone/features/settings/repos/settings_config_repo.dart';
import 'package:thread_clone/features/settings/view_models/settings_config_vm.dart';
import 'package:thread_clone/router.dart';
import 'package:thread_clone/utils/ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GoRouter.optionURLReflectsImperativeAPIs = true;

  final preferences = await SharedPreferences.getInstance();
  final repository = SettingsConfigRepository(preferences);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SettingsConfigViewModel(repository),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Thread clone',
      themeMode: isDarkMode(context) ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          elevation: 0,
          color: Colors.white,
          padding: EdgeInsets.all(2),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          showDragHandle: true,
          dragHandleColor: Colors.grey.shade400,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          color: Colors.black87,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          elevation: 0,
          color: Colors.black87,
          padding: EdgeInsets.all(2),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.grey.shade900,
          showDragHandle: true,
          dragHandleColor: Colors.grey.shade500,
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
