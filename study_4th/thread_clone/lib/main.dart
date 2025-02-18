import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/router.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Thread clone',
      themeMode: ThemeMode.system,
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
