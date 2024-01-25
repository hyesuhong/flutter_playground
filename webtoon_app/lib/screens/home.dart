import 'package:flutter/material.dart';
import 'package:webtoon_app/models/toon_model.dart';
import 'package:webtoon_app/services/api_service.dart';
import 'package:webtoon_app/widgets/header_bar.dart';
import 'package:webtoon_app/widgets/toon_card.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Future<List<ToonModel>> toons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HeaderBar(title: 'Today\'s toons'),
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
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      itemCount: snapshot.data!.length,
      separatorBuilder: (context, index) => const SizedBox(width: 40),
      itemBuilder: (context, index) {
        var toon = snapshot.data![index];
        return ToonCard(toon: toon);
      },
    );
  }
}
