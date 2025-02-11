import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/activity/models/activity_model.dart';
import 'package:thread_clone/features/activity/widgets/activity_tab.dart';
import 'package:thread_clone/features/activity/widgets/activity_tile.dart';

const _tabs = [
  "All",
  "Follows",
  "Replies",
  "Mentions",
  "Quotes",
  "Reposts",
];

List<ActivityModel> _activities = List.generate(
  20,
  (index) => ActivityModel.generate(),
);

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this);
    _controller.addListener(() {
      _selectedIndex = _controller.index;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Activity",
          style: TextStyle(
            fontSize: Sizes.size32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.7,
          ),
        ),
        centerTitle: false,
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          overlayColor: WidgetStateColor.transparent,
          tabAlignment: TabAlignment.start,
          labelPadding: const EdgeInsets.symmetric(horizontal: Sizes.size4),
          tabs: _tabs.map((tab) {
            int index = _tabs.indexOf(tab);
            return ActivityTab(
              text: tab,
              isSelected: index == _selectedIndex,
            );
          }).toList(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: Sizes.size16,
          right: Sizes.size16,
          bottom: Sizes.size16,
        ),
        child: ListView.separated(
            itemBuilder: (context, index) {
              var activity = _activities[index];
              return ActivityTile(
                user: activity.user,
                kind: activity.kind,
                content: activity.content,
                createdAt: activity.createdAt,
                comment: activity.comment,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: _activities.length),
      ),
    );
  }
}
