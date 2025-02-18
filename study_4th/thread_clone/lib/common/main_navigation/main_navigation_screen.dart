import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/main_navigation/models/tab_model.dart';
import 'package:thread_clone/common/main_navigation/widgets/nav_tab.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/writing/writing_screen.dart';

List<TabModel> _tabs = [
  TabModel(
    name: "Home",
    path: '/',
    icon: FontAwesomeIcons.house,
  ),
  TabModel(
    name: "Search",
    path: '/search',
    icon: FontAwesomeIcons.magnifyingGlass,
  ),
  TabModel(
    name: "Writing",
    path: '/writing',
    icon: FontAwesomeIcons.pen,
  ),
  TabModel(
    name: "Activity",
    path: '/activity',
    icon: FontAwesomeIcons.heart,
  ),
  TabModel(
    name: "Profile",
    path: '/profile',
    icon: FontAwesomeIcons.user,
  ),
];

class MainNavigationScreen extends StatelessWidget {
  final Widget child;

  const MainNavigationScreen({
    super.key,
    required this.child,
  });

  void _onWritingTap(context) async {
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

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    int selectedTabIndex = _tabs.indexWhere((tab) => tab.path == location);

    if (selectedTabIndex < 0 && location.startsWith('/settings')) {
      return _tabs.indexWhere((tab) => tab.path == '/profile');
    }

    return selectedTabIndex < 0 ? 0 : selectedTabIndex;
  }

  void _onItemTapped(int index, BuildContext context) {
    var path = _tabs[index].path;
    switch (index) {
      case 2:
        return _onWritingTap(context);
      default:
        return GoRouter.of(context).go(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: child,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_tabs.length, (index) {
            return NavTab(
              icon: _tabs[index].icon,
              isSelected: _calculateSelectedIndex(context) == index,
              onTap: () {
                _onItemTapped(index, context);
              },
            );
          }),
        ),
      ),
    );
  }
}
