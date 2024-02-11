import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wibudesu2/constant/apiconstant.dart';
import 'package:wibudesu2/models/topairing.dart';

final dio = Dio();

// abstract class CSAnime {
//   Future<List<RecentAnime>?> getItem({@required List<RecentAnime>? param});
// }

// class CSAnimeImp implements CSAnime {
//   @override
//   Future<List<RecentAnime>?> getItem({List<RecentAnime>? param}) async {
//     List<RecentAnime> items = [];

//     Response response;
//     // response = await dio.get('/test?id=12&name=dio');
//     // print(response.data.toString());
//     // // The below request is the same as above.
//     response = await dio.get(
//       '$baseUrl/anime/gogoanime/recent-episodes',
//       // queryParameters: {'id': 12, 'name': 'dio'},
//     );

//     return null;
//   }
// }

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
}
