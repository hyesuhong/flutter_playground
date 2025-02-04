import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/utils/format.dart';

class PostContent extends StatelessWidget {
  final String profileUrl;
  final String username;
  final DateTime createdAt;
  final String contentText;
  final List<String> contentImageUrls;
  final int replies;
  final int likes;

  const PostContent({
    super.key,
    required this.profileUrl,
    required this.username,
    required this.createdAt,
    required this.contentText,
    required this.contentImageUrls,
    required this.replies,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(profileUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(48),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(username),
                        ),
                        Text(formatDate(createdAt)),
                        const SizedBox(width: 16),
                        const FaIcon(FontAwesomeIcons.ellipsis),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(contentText),
                    const SizedBox(height: 8),
                    if (contentImageUrls.isNotEmpty)
                      SizedBox(
                        height: 256,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contentImageUrls.length,
                          itemBuilder: (context, imgIndex) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: 12,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  contentImageUrls[imgIndex],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: 20,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        FaIcon(
                          FontAwesomeIcons.comment,
                          size: 20,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        FaIcon(
                          FontAwesomeIcons.retweet,
                          size: 20,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        FaIcon(
                          FontAwesomeIcons.paperPlane,
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              const SizedBox(width: 64),
              Text(
                "$replies replies",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
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
      ),
    );
  }
}
