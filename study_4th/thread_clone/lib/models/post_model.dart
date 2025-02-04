import 'package:faker/faker.dart';

class PostModel {
  final String profileUrl;
  final String username;
  final DateTime createdAt;
  final String contentText;
  final List<String> contentImageUrls;
  final int replies;
  final int likes;

  PostModel({
    required this.profileUrl,
    required this.username,
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

    return PostModel(
      profileUrl:
          "https://i.pravatar.cc/150?img=${faker.randomGenerator.integer(50)}",
      username: faker.internet.userName(),
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
