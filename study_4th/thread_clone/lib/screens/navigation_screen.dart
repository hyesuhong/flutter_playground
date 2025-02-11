import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/screens/activity_screen.dart';
import 'package:thread_clone/screens/home_screen.dart';
import 'package:thread_clone/screens/placeholder_screen.dart';
import 'package:thread_clone/screens/search_screen.dart';
import 'package:thread_clone/screens/writing_screen.dart';
import 'package:thread_clone/widgets/nav_tab.dart';

const tabIcons = [
  FontAwesomeIcons.house,
  FontAwesomeIcons.magnifyingGlass,
  FontAwesomeIcons.pen,
  FontAwesomeIcons.heart,
  FontAwesomeIcons.user,
];

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
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
          top: Radius.circular(20),
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
            child: const PlaceholderScreen(
              placeholder: "Profile",
            ),
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
