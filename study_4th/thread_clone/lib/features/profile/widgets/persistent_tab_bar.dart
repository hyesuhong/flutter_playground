import 'package:flutter/material.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: const TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        overlayColor: WidgetStateColor.transparent,
        tabs: [
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
