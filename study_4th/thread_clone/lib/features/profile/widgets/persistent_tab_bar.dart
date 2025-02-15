import 'package:flutter/material.dart';
import 'package:thread_clone/utils/ui.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: isDarkMode(context) ? Colors.black : Colors.white,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: isDarkMode(context) ? Colors.white : Colors.black,
        labelColor: isDarkMode(context) ? Colors.white : Colors.black,
        unselectedLabelColor: Colors.grey,
        overlayColor: WidgetStateColor.transparent,
        tabs: const [
          Tab(text: "Threads"),
          Tab(text: "Replies"),
        ],
      ),
    );
  }

  @override
  double get minExtent => 48;

  @override
  double get maxExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
