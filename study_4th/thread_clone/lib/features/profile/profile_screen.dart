import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/post/models/post_model.dart';
import 'package:thread_clone/common/post/widgets/post_list_tile.dart';
import 'package:thread_clone/common/user_profile/models/user_model.dart';
import 'package:thread_clone/common/user_profile/user_profile.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/routes.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/profile/widgets/persistent_tab_bar.dart';

var _posts = List.generate(20, (index) => PostModel.generate());
var _replies = List.generate(20, (index) => PostModel.generate());

var _user = UserModel(
  profileUrl:
      "https://images.unsplash.com/photo-1506543730435-e2c1d4553a84?q=80&w=2362&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  username: "Jane",
  description: "Plant enthusiast!",
  followers: Random().nextInt(100),
);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _onMenuTap(BuildContext context) {
    context.pushNamed(Routes.settings.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.center,
          child: const FaIcon(FontAwesomeIcons.globe),
        ),
        leadingWidth: Sizes.size48,
        actions: [
          Container(
            width: Sizes.size48,
            alignment: Alignment.center,
            child: const FaIcon(FontAwesomeIcons.instagram),
          ),
          GestureDetector(
            onTap: () => _onMenuTap(context),
            child: Container(
              width: Sizes.size48,
              alignment: Alignment.center,
              child: const FaIcon(FontAwesomeIcons.bars),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: Sizes.size96 * 2,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size8,
                  ),
                  child: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _user.username,
                                  style: const TextStyle(
                                    fontSize: Sizes.size24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.v2,
                                const Text(
                                  "jane_mobbin",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                              ],
                            ),
                            UserProfile(imageUrl: _user.profileUrl),
                          ],
                        ),
                        Gaps.v8,
                        Text(
                          _user.description,
                          style: const TextStyle(
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.v12,
                        Text(
                          "${_user.followers} Followers",
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Gaps.v12,
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size8,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(Sizes.size8),
                                ),
                                child: const Text(
                                  "Edit profile",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Gaps.h8,
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size8,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(Sizes.size8),
                                ),
                                child: const Text(
                                  "Share profile",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size8,
                ),
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  var post = _posts[index];

                  return PostListTile(
                    profileUrl: _user.profileUrl,
                    username: _user.username,
                    createdAt: post.createdAt,
                    contentText: post.contentText,
                    contentImageUrls: post.contentImageUrls,
                    replies: post.replies,
                    likes: post.likes,
                  );
                },
              ),
              ListView.builder(
                itemCount: _replies.length,
                itemBuilder: (context, index) {
                  var post = _replies[index];

                  return PostListTile(
                    profileUrl: _user.profileUrl,
                    username: _user.username,
                    createdAt: post.createdAt,
                    contentText: post.contentText,
                    contentImageUrls: post.contentImageUrls,
                    replies: post.replies,
                    likes: post.likes,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
