import 'package:flutter/material.dart';
import 'package:webtoon_app/models/toon_detail_model.dart';
import 'package:webtoon_app/models/toon_episode_model.dart';
import 'package:webtoon_app/services/api_service.dart';
import 'package:webtoon_app/styles/font.dart';
import 'package:webtoon_app/widgets/header_bar.dart';
import 'package:webtoon_app/widgets/thumbnail.dart';

class DetailScreen extends StatefulWidget {
  final String id, title, thumb;
  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<ToonDetailModel> toon;
  late Future<List<ToonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();

    toon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(
        title: widget.title,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Thumbnail(
                  id: widget.id,
                  thumbUrl: widget.thumb,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            FutureBuilder(
              future: toon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 14,
                            fontVariations: [NotoSansKRWeight.w300],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              '장르',
                              style: TextStyle(
                                fontVariations: [NotoSansKRWeight.w300],
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text.rich(
                              TextSpan(
                                text: '',
                                children:
                                    buildGenresWidget(snapshot.data!.genre),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              '연령',
                              style: TextStyle(
                                fontVariations: [NotoSansKRWeight.w300],
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              snapshot.data!.age,
                              style: const TextStyle(
                                fontVariations: [NotoSansKRWeight.w300],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }
                return const Text('...');
              },
            ),
            const SizedBox(
              height: 24,
            ),
            FutureBuilder(
              future: episodes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return buildEpisodesList(snapshot.data!);
                  // return Column(
                  //   children: [
                  //     for (var episode in snapshot.data!)
                  //       Text('${episode.title} ${episode.rating}'),
                  //   ],
                  // );
                }
                return const Text('...');
              },
            )
          ],
        ),
      ),
    );
  }
}

List<TextSpan> buildGenresWidget(List<String> genres) {
  List<TextSpan> genreText = [];
  final int totalGenres = genres.length;

  for (int i = 0; i < totalGenres; i++) {
    TextSpan genre = TextSpan(
      text: genres[i],
      style: const TextStyle(
        fontVariations: [NotoSansKRWeight.w300],
      ),
    );

    if (i + 1 == totalGenres) {
      genreText.add(genre);
    } else {
      TextSpan seperator = const TextSpan(
        text: ' | ',
        style: TextStyle(color: Colors.grey),
      );
      genreText.addAll([
        genre,
        seperator,
      ]);
    }
  }

  return genreText;
}

Widget buildEpisodesList(List<ToonEpisodeModel> episodes) {
  return ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: episodes.length,
    itemBuilder: (context, index) {
      return Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: Image.network(
                episodes[index].thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(episodes[index].title),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(episodes[index].date),
                ],
              ),
            )
          ],
        ),
      );
    },
    separatorBuilder: (context, index) {
      return const SizedBox(height: 10);
    },
  );
}
