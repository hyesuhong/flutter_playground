import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/post/models/post_model.dart';
import 'package:thread_clone/features/post/view_models/search_view_model.dart';
import 'package:thread_clone/features/post/widgets/post_list_tile.dart';
import 'package:thread_clone/utils/ui.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<PostModel> _searchResult = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _onInputChange(String value) async {
    var list = await ref.read(searchProvider.notifier).getPostsByKeyword(value);

    _searchResult = list ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(
            fontSize: Sizes.size32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.7,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: Sizes.size16,
          right: Sizes.size16,
          bottom: Sizes.size16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Sizes.size40,
              child: CupertinoTextField(
                controller: _controller,
                onChanged: _onInputChange,
                prefix: Container(
                  width: Sizes.size36,
                  height: Sizes.size40,
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: Sizes.size18,
                    color: Colors.grey.shade500,
                  ),
                ),
                placeholder: "Search posts by keyword",
                placeholderStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                decoration: BoxDecoration(
                  color: isDarkMode(ref)
                      ? Colors.grey.shade900
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(Sizes.size8),
                ),
                style: TextStyle(
                  color: isDarkMode(ref) ? Colors.white : Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResult.length,
                itemBuilder: (context, index) {
                  PostModel post = _searchResult[index];
                  return PostListTile(
                    profileUrl: "https://i.pravatar.cc/150?img=10",
                    username: post.creatorUsername,
                    createdAt:
                        DateTime.fromMillisecondsSinceEpoch(post.createdAt),
                    contentText: post.contentText,
                    contentImageUrls: post.contentImageUrls,
                    replies: post.replies,
                    likes: post.likes,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
