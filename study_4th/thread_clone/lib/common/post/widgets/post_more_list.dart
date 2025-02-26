import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/common/post/widgets/post_more_item.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/utils/ui.dart';

typedef MenuItem = ({
  String label,
  bool? isDangerous,
  void Function()? onTap,
});

class PostMoreList extends ConsumerWidget {
  final List<MenuItem> items;

  const PostMoreList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isDarkMode(ref) ? Colors.grey[850] : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var item = items[index];
          return PostMoreItem(
            label: item.label,
            isDangerous: item.isDangerous ?? false,
            onTap: item.onTap,
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: 0,
          thickness: 1,
          color: isDarkMode(ref) ? Colors.grey.shade700 : Colors.grey.shade300,
        ),
        itemCount: items.length,
      ),
    );
  }
}
