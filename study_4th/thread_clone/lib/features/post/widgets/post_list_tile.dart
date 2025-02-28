import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/common_widgets/button/custom_icon_button.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/post/widgets/post_more_menu.dart';
import 'package:thread_clone/features/profile/widgets/user_profile.dart';
import 'package:thread_clone/utils/format.dart';

class PostListTile extends StatelessWidget {
  final String profileUrl;
  final String username;
  final DateTime createdAt;
  final String contentText;
  final List<String> contentImageUrls;
  final int replies;
  final int likes;

  const PostListTile({
    super.key,
    required this.profileUrl,
    required this.username,
    required this.createdAt,
    required this.contentText,
    required this.contentImageUrls,
    required this.replies,
    required this.likes,
  });

  void _onMoreTap(context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => const PostMoreMenu(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  UserProfile(imageUrl: profileUrl),
                  Gaps.v10,
                  const Expanded(
                    child: VerticalDivider(
                      thickness: 1.4,
                    ),
                  ),
                ],
              ),
              Gaps.h16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            username,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(formatDate(createdAt)),
                        Gaps.h8,
                        CustomIconButton(
                          icon: FontAwesomeIcons.ellipsis,
                          onTap: () => _onMoreTap(context),
                        )
                      ],
                    ),
                    Gaps.v2,
                    Text(contentText),
                    Gaps.h8,
                    if (contentImageUrls.isNotEmpty)
                      SizedBox(
                        height: Sizes.size64 * 4,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contentImageUrls.length,
                          padding: const EdgeInsets.only(top: Sizes.size8),
                          itemBuilder: (context, imgIndex) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: Sizes.size12,
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size8),
                                child: Image.network(
                                  contentImageUrls[imgIndex],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    Gaps.v16,
                    const Row(
                      children: [
                        CustomIconButton(
                          icon: FontAwesomeIcons.heart,
                        ),
                        Gaps.h12,
                        CustomIconButton(
                          icon: FontAwesomeIcons.comment,
                        ),
                        Gaps.h12,
                        CustomIconButton(
                          icon: FontAwesomeIcons.retweet,
                        ),
                        Gaps.h12,
                        CustomIconButton(
                          icon: FontAwesomeIcons.paperPlane,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Gaps.v4,
        Row(
          children: [
            Gaps.h64,
            Text(
              "$replies replies",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size4),
              child: Text(
                "•",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            Text(
              "$likes likes",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
