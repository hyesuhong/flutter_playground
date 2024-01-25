import 'package:flutter/material.dart';
import 'package:webtoon_app/models/toon_model.dart';
import 'package:webtoon_app/services/api_service.dart';
import 'package:webtoon_app/styles/font.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Future<List<ToonModel>> toons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[600],
        elevation: 5,
        title: const Text(
          'Today\'s toons',
          style: TextStyle(
            fontSize: 20,
            fontVariations: [NotoSansKRWeight.w500],
          ),
        ),
      ),
      body: FutureBuilder(
        future: toons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Expanded(child: makeToonList(snapshot)),
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeToonList(AsyncSnapshot<List<ToonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      itemCount: snapshot.data!.length,
      separatorBuilder: (context, index) => const SizedBox(width: 40),
      itemBuilder: (context, index) {
        var toon = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 8),
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ),
              child: Image.network(
                toon.thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              toon.title,
              style: const TextStyle(
                  fontSize: 16, fontVariations: [NotoSansKRWeight.w400]),
            )
          ],
        );
      },
    );
  }
}
