import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const timerSeconds = 60;

  int totalSeconds = timerSeconds;
  bool isRunning = false;
  int totalPomodoros = 0;

  bool resettable = false;

  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      timer.cancel();
      setState(() {
        totalPomodoros++;
        isRunning = false;
        totalSeconds = timerSeconds;
      });
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      onTick,
    );

    setState(() {
      isRunning = true;
      resettable = true;
    });
  }

  void onPausePressed() {
    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void onRefreshPressed() {
    timer.cancel();
    setState(() {
      totalPomodoros = 0;
      isRunning = false;
      totalSeconds = timerSeconds;
      resettable = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 88,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 112,
                    color: Theme.of(context).cardColor,
                    icon: isRunning
                        ? const Icon(Icons.pause_circle_outline)
                        : const Icon(Icons.play_circle_outline),
                    onPressed: () =>
                        isRunning ? onPausePressed() : onStartPressed(),
                  ),
                  AnimatedPadding(
                    padding: resettable
                        ? const EdgeInsets.only(
                            bottom: 32,
                          )
                        : EdgeInsets.zero,
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    curve: Curves.linear,
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    switchInCurve: Curves.linear,
                    switchOutCurve: Curves.linear,
                    child: resettable
                        ? IconButton(
                            icon: const Icon(Icons.refresh),
                            iconSize: 32,
                            color: Theme.of(context).cardColor,
                            onPressed: () => onRefreshPressed(),
                          )
                        : const SizedBox.shrink(),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
