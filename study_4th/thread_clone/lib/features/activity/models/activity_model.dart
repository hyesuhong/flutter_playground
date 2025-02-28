import 'package:faker/faker.dart';
import 'package:thread_clone/features/profile/models/user_model.dart';

enum ActivityKind {
  follows,
  replies,
  mentions,
  quotes,
  reposts,
}

class ActivityModel {
  final UserModel user;
  final ActivityKind kind;
  final String content;
  final String createdAt;
  final String? comment;

  ActivityModel({
    required this.user,
    required this.kind,
    required this.content,
    required this.createdAt,
    this.comment,
  });

  factory ActivityModel.generate() {
    final faker = Faker();

    var aKind = ActivityKind
        .values[faker.randomGenerator.integer(ActivityKind.values.length)];
    var aComment =
        aKind == ActivityKind.replies ? faker.lorem.sentence() : null;

    return ActivityModel(
      user: UserModel.generate(),
      kind: aKind,
      content: faker.lorem.sentence(),
      createdAt: "${faker.randomGenerator.integer(12)}h",
      comment: aComment,
    );
  }
}
