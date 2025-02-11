import 'package:faker/faker.dart';

class UserModel {
  final String profileUrl;
  final String username;
  final String description;
  final int followers;

  UserModel({
    required this.profileUrl,
    required this.username,
    required this.description,
    required this.followers,
  });

  factory UserModel.generate() {
    final faker = Faker();

    return UserModel(
      profileUrl:
          "https://i.pravatar.cc/150?img=${faker.randomGenerator.integer(50)}",
      username: faker.internet.userName(),
      description: faker.lorem.sentence(),
      followers: faker.randomGenerator.integer(10000000, min: 100),
    );
  }
}
