import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/common/main_navigation/widgets/nav_tab.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/activity/activity_screen.dart';
import 'package:thread_clone/features/home/home_screen.dart';
import 'package:thread_clone/features/profile/profile_screen.dart';
import 'package:thread_clone/features/search/search_screen.dart';
import 'package:thread_clone/features/writing/writing_screen.dart';

const tabIcons = [
  FontAwesomeIcons.house,
  FontAwesomeIcons.magnifyingGlass,
  FontAwesomeIcons.pen,
  FontAwesomeIcons.heart,
  FontAwesomeIcons.user,
];

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onNavigationTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWritingTap() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => const WritingScreen(),
      showDragHandle: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Sizes.size20),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const ProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(tabIcons.length, (index) {
            return NavTab(
              icon: tabIcons[index],
              isSelected: _selectedIndex == index,
              onTap: () {
                if (index == 2) {
                  _onWritingTap();
                  return;
                }

                _onNavigationTap(index);
              },
            );
          }),
        ),
      ),
    );
  }
}
