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
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) {
                var toon = snapshot.data![index];
                return Text(toon.title);
              },
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
}
