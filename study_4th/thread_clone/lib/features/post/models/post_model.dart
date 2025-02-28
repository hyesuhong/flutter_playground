class PostModel {
  final String creatorUid;
  final String creatorUsername;
  final String? id;
  final int createdAt;
  final String contentText;
  // final List<String> contentImageUrls;
  final bool? hasImages;
  final int replies;
  final int likes;
  List<String> contentImageUrls = [];

  PostModel({
    this.creatorUid = "",
    this.creatorUsername = "anonmyous",
    this.id,
    required this.createdAt,
    required this.contentText,
    // required this.contentImageUrls,
    this.hasImages = false,
    required this.replies,
    required this.likes,
  });

  PostModel.fromJson({
    required Map<String, dynamic> json,
    required String postId,
  })  : id = postId,
        creatorUid = "",
        creatorUsername = "anonmyous",
        createdAt = json["createdAt"],
        contentText = json["contentText"],
        // contentImageUrls = json["contentImageUrls"],
        hasImages = json["hasImages"],
        replies = json["replies"],
        likes = json["likes"];

  Map<String, dynamic> toJson() {
    return {
      "creatorUid": creatorUid,
      "creatorUsername": creatorUsername,
      "createdAt": createdAt,
      "contentText": contentText,
      // "contentImageUrls": contentImageUrls,
      "hasImages": hasImages,
      "replies": replies,
      "likes": likes,
    };
  }
}
