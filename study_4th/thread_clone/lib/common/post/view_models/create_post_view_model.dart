import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/post/models/post_model.dart';
import 'package:thread_clone/common/post/repos/posts_repository.dart';
import 'package:thread_clone/common/post/view_models/timeline_view_model.dart';

class CreatePostViewModel extends AsyncNotifier<void> {
  late final PostsRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(postsRepo);
  }

  Future<void> createPost(
    BuildContext context, {
    required String contentText,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.savePost(PostModel(
        contentText: contentText,
        createdAt:
            DateTime.now().millisecondsSinceEpoch - (1000 * 60 * 60 * 24),
        replies: 0,
        likes: 0,
      ));

      ref.read(timelineProvider.notifier).refresh();

      if (context.mounted) {
        context.pop();
      }
    });
  }
}

final createPostProvider = AsyncNotifierProvider<CreatePostViewModel, void>(
  () => CreatePostViewModel(),
);
