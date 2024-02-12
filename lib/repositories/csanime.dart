import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wibudesu2/constant/apiconstant.dart';
import 'package:wibudesu2/models/animeinformation.dart';
import 'package:wibudesu2/models/topairing.dart';

final dio = Dio();

class CSAnimeService {
  Future<TopAiringModel?> getTopAiring() async {
    try {
      Response response;
      response = await dio.get(
        '$baseUrl/anime/gogoanime/top-airing',
        // queryParameters: {'id': 12, 'name': 'dio'},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> resjson = response.data;
        // List<RecentAnime> _model = userModelFromJson(response.body);

        TopAiringModel topAiringData = TopAiringModel.fromJson(resjson);
        return topAiringData;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<AnimeInformation?> getInformationById(id) async {
    try {
      Response response;
      response = await dio.get(
        '$baseUrl/anime/gogoanime/info/$id',
        // queryParameters: {'id': 12, 'name': 'dio'},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> resjson = response.data;
        // List<RecentAnime> _model = userModelFromJson(response.body);

        AnimeInformation animeInformation = AnimeInformation.fromJson(resjson);
        return animeInformation;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
