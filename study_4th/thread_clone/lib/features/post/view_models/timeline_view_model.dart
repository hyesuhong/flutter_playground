import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/features/post/models/post_model.dart';
import 'package:thread_clone/features/post/repos/posts_repository.dart';

class TimelineViewModel extends AsyncNotifier<List<PostModel>> {
  late final PostsRepository _repository;
  List<PostModel> _list = [];

  @override
  Future<List<PostModel>> build() async {
    _repository = ref.read(postsRepo);
    _list = await _getPosts();
    return _list;
  }

  Future<List<PostModel>> _getPosts() async {
    final result = await _repository.getPosts();
    final posts = result.docs.map(
      (doc) => PostModel.fromJson(
        json: doc.data(),
        postId: doc.id,
      ),
    );
    return posts.toList();
  }

  Future<void> refresh() async {
    final posts = await _getPosts();
    _list = posts;
    state = AsyncValue.data(posts);
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<PostModel>>(
  () => TimelineViewModel(),
);
