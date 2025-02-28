import 'package:flutter/material.dart';
import 'package:thread_clone/features/activity/models/activity_model.dart';
import 'package:thread_clone/features/profile/models/user_model.dart';
import 'package:thread_clone/features/profile/widgets/user_profile.dart';

class ActivityTile extends StatelessWidget {
  final UserModel user;
  final ActivityKind kind;
  final String content;
  final String createdAt;
  final String? comment;

  const ActivityTile({
    super.key,
    required this.user,
    required this.createdAt,
    required this.kind,
    required this.content,
    this.comment,
  });

  Widget _buildSubtitle(ActivityKind aKind) {
    final String subtitle;

    switch (aKind) {
      case ActivityKind.follows:
        subtitle = "Followed you";
        break;
      case ActivityKind.mentions:
        subtitle = "Mentioned you";
        break;
      case ActivityKind.quotes:
        subtitle = "Quoted you";
        break;
      case ActivityKind.replies:
      case ActivityKind.reposts:
        subtitle = content;
        break;
      default:
        subtitle = '';
        break;
    }

    return Text(
      subtitle,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Widget _buildContent(ActivityKind aKind) {
    final String text;

    switch (aKind) {
      case ActivityKind.mentions:
        text = content;
        break;
      case ActivityKind.replies:
        text = comment.toString();
        break;
      default:
        text = '';
        break;
    }

    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: UserProfile(imageUrl: user.profileUrl),
      title: Row(
        children: [
          Text(user.username),
          const SizedBox(width: 8),
          Text(
            createdAt,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubtitle(kind),
          _buildContent(kind),
        ],
      ),
      trailing: kind == ActivityKind.follows
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text("Follow back"),
            )
          : null,
    );
  }
}
