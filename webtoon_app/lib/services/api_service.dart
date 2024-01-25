import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_app/models/toon_model.dart';

class ApiService {
  final String baseURL = 'https://webtoon-crawler.nomadcoders.workers.dev';

  final String today = '/today';

  Future<List<ToonModel>> getTodayToons() async {
    final url = Uri.parse('$baseURL$today');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Error();
    }

    final List<dynamic> toons = jsonDecode(response.body);
    var toonData = toons.map((e) => ToonModel.fromJson(e)).toList();

    return toonData;
  }
}
