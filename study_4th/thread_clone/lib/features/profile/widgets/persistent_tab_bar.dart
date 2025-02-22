import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/utils/ui.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const TabBarWrapper();
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

class TabBarWrapper extends ConsumerWidget {
  const TabBarWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: isDarkMode(ref) ? Colors.black : Colors.white,
      child: const ProfileTabBar(),
    );
  }
}

class ProfileTabBar extends ConsumerWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: isDarkMode(ref) ? Colors.white : Colors.black,
      labelColor: isDarkMode(ref) ? Colors.white : Colors.black,
      unselectedLabelColor: Colors.grey,
      overlayColor: WidgetStateColor.transparent,
      tabs: const [
        Tab(text: "Threads"),
        Tab(text: "Replies"),
      ],
    );
  }
}
