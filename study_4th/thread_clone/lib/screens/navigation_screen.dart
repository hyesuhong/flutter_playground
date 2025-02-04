import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(tabIcons.length, (index) {
            return NavTab(
              icon: tabIcons[index],
              isSelected: _selectedIndex == index,
              onTap: () => _onNavigationTap(index),
            );
          }),
        ),
      ),
    );
  }
}
