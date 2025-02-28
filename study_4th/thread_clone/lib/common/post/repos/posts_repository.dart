import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/common/post/models/post_model.dart';

class PostsRepository {
  final String _collectionPath = "posts";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // create post document
  Future<void> savePost(PostModel data) async {
    await _db.collection(_collectionPath).add(data.toJson());
  }

  // upload image files

  // get post documents
  Future<QuerySnapshot<Map<String, dynamic>>> getPosts() async {
    final query =
        _db.collection(_collectionPath).orderBy("createdAt", descending: true);

    return query.get();
  }
}

final postsRepo = Provider((ref) => PostsRepository());
