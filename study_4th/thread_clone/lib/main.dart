import 'package:flutter/material.dart';
import 'package:thread_clone/common/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thread clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
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
      home: const MainNavigationScreen(),
    );
  }
}
