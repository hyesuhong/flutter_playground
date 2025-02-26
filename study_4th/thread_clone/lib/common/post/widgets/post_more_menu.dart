import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/common/post/widgets/post_more_list.dart';
import 'package:thread_clone/common/post/widgets/post_report_menu.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class PostMoreMenu extends ConsumerWidget {
  const PostMoreMenu({super.key});

  void _onReportTap(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      builder: (context) => const PostReportMenu(),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.73,
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<List<MenuItem>> menuLists = [
      [
        (label: "Unfollow", isDangerous: false, onTap: null),
        (label: "Mute", isDangerous: false, onTap: null),
      ],
      [
        (label: "Hide", isDangerous: false, onTap: null),
        (
          label: "Report",
          isDangerous: true,
          onTap: () => _onReportTap(context)
        ),
      ],
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: Sizes.size20,
        right: Sizes.size20,
        bottom: Sizes.size40,
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var items = menuLists[index];
          return PostMoreList(items: items);
        },
        separatorBuilder: (context, index) => Gaps.v24,
        itemCount: menuLists.length,
      ),
    );
  }
}
