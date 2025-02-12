import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

enum Direction {
  up,
  down,
}

enum Page {
  first,
  second,
}

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.down;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy > 0) {
      setState(() {
        _direction = Direction.down;
      });
    } else {
      setState(() {
        _direction = Direction.up;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _showingPage = _direction == Direction.up ? Page.second : Page.first;
    });
  }

  void _onStartTap() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: SafeArea(
          child: AnimatedCrossFade(
            crossFadeState: _showingPage == Page.first
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 600),
            firstChild: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size24,
                vertical: Sizes.size40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Watch cool videos!',
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v8,
                  Text(
                    'Videos are personalized for you based on what you watch, like, and share.',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black54,
                    ),
                  ),
                  Gaps.v20,
                ],
              ),
            ),
            secondChild: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size24,
                vertical: Sizes.size40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enjoy!',
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v8,
                  Text(
                    'Videos are personalized for you based on what you watch, like, and share.',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black54,
                    ),
                  ),
                  Gaps.v20,
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size4,
              horizontal: Sizes.size4,
            ),
            child: AnimatedOpacity(
              opacity: _showingPage == Page.second ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: GestureDetector(
                onTap: _showingPage == Page.second ? _onStartTap : null,
                child: Container(
                  alignment: Alignment.center,
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'Start Watching',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: Sizes.size14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
