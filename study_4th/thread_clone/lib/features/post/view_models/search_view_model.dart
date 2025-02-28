import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/features/post/models/post_model.dart';
import 'package:thread_clone/features/post/repos/posts_repository.dart';

class SearchViewModel extends AsyncNotifier<List<PostModel>?> {
  late final PostsRepository _repository;

  @override
  Future<List<PostModel>?> build() async {
    _repository = ref.read(postsRepo);
    return null;
  }

  Future<List<PostModel>?> getPostsByKeyword(String keyword) async {
    if (keyword.isEmpty) {
      return null;
    }

    final result = await _repository.getPostsByKeyword(keyword);
    final posts = result.map(
      (doc) => PostModel.fromJson(
        json: doc.data(),
        postId: doc.id,
      ),
    );

    return posts.toList();
  }
}

final searchProvider = AsyncNotifierProvider<SearchViewModel, List<PostModel>?>(
  () => SearchViewModel(),
);
