import 'package:flutter/material.dart';
import 'package:webtoon_app/screens/home.dart';
import 'package:webtoon_app/styles/font.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: CustomFontFamily.notoSansKR,
      ),
      home: const Home(),
    );
  }
}
