import 'package:flutter/material.dart';
import 'package:webtoon_app/models/toon_model.dart';
import 'package:webtoon_app/screens/detail_screen.dart';
import 'package:webtoon_app/styles/font.dart';
import 'package:webtoon_app/widgets/thumbnail.dart';

class ToonCard extends StatelessWidget {
  final ToonModel toon;
  const ToonCard({
    super.key,
    required this.toon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => DetailScreen(
              id: toon.id,
              title: toon.title,
              thumb: toon.thumb,
            ),
          ),
        );
        print(toon.title);
      },
      child: Column(
        children: [
          Thumbnail(
            id: toon.id,
            thumbUrl: toon.thumb,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            toon.title,
            style: const TextStyle(
              fontSize: 16,
              fontVariations: [NotoSansKRWeight.w400],
            ),
          )
        ],
      ),
    );
  }
}
