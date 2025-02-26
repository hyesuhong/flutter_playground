import 'package:faker/faker.dart';
import 'package:thread_clone/common/user_profile/models/user_model.dart';

class PostModel {
  final UserModel user;
  final DateTime createdAt;
  final String contentText;
  final List<String> contentImageUrls;
  final int replies;
  final int likes;

  PostModel({
    required this.user,
    required this.createdAt,
    required this.contentText,
    required this.contentImageUrls,
    required this.replies,
    required this.likes,
  });

  factory PostModel.generate() {
    final faker = Faker();

    List<String> images =
        List.generate(faker.randomGenerator.integer(4), (index) {
      int imageNumber = faker.randomGenerator.integer(1000);
      return faker.image.loremPicsum(random: imageNumber);
    });

    UserModel generatedUser = UserModel.generate();

    return PostModel(
      user: generatedUser,
      createdAt: faker.date.dateTime(
        minYear: 2024,
        maxYear: 2025,
      ),
      contentText: faker.lorem.sentence(),
      contentImageUrls: images,
      replies: faker.randomGenerator.integer(50),
      likes: faker.randomGenerator.integer(100),
    );
  }
}
