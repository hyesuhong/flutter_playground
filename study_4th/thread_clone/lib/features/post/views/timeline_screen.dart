import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/post/models/post_model.dart';
import 'package:thread_clone/features/post/view_models/timeline_view_model.dart';
import 'package:thread_clone/features/post/widgets/post_list_tile.dart';

class TimelineScreen extends ConsumerStatefulWidget {
  const TimelineScreen({super.key});

  @override
  ConsumerState<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends ConsumerState<TimelineScreen> {
  Future<void> _onRefresh() {
    return ref.watch(timelineProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(timelineProvider).when(
          data: (posts) {
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: Scaffold(
                appBar: AppBar(
                  title: const FaIcon(
                    FontAwesomeIcons.threads,
                    size: Sizes.size32,
                  ),
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(Sizes.size16),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      PostModel post = posts[index];
                      return PostListTile(
                        profileUrl: "https://i.pravatar.cc/150?img=10",
                        username: post.creatorUsername,
                        createdAt:
                            DateTime.fromMillisecondsSinceEpoch(post.createdAt),
                        contentText: post.contentText,
                        contentImageUrls: post.contentImageUrls,
                        replies: post.replies,
                        likes: post.likes,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: posts.length,
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(
                'Could not load posts: $error',
                style: const TextStyle(color: Colors.red),
              ),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
