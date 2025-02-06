import 'package:flutter/material.dart';
import 'package:thread_clone/widgets/post_report_menu.dart';

class PostMoreMenu extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                _buildMoreItem(label: "Unfollow"),
                Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                _buildMoreItem(label: "Mute"),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                _buildMoreItem(label: "Hide"),
                Divider(
                  height: 0,
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                _buildMoreItem(
                  label: "Report",
                  isDangerous: true,
                  onTap: () => _onReportTap(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildMoreItem({
  void Function()? onTap,
  required String label,
  bool isDangerous = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: isDangerous ? Colors.red : Colors.black87,
        ),
      ),
    ),
  );
}
