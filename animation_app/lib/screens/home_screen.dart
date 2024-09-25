import 'package:flutter/material.dart';

const animationList = [
  'Implicit Animations',
  'TweenAnimationBuilder',
  'Explicit Animations',
  'CustomPainter',
  'Swiper',
  'Music Player',
  'Rive',
  'Container Transform',
  'Shared Axis',
  'Fade Trough',
  'Flutter Animate',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ...List.generate(
                animationList.length,
                (index) => index == animationList.length - 1
                    ? FilledButton.tonal(
                        onPressed: () {}, child: Text(animationList[index]))
                    : Column(
                        children: [
                          FilledButton.tonal(
                            onPressed: () {},
                            child: Text(animationList[index]),
                          ),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
