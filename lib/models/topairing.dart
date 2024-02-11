class TopAiringModel {
  int? currentPage;
  bool? hasNextPage;
  List<TopAiringListModel>? results;

  TopAiringModel({this.currentPage, this.hasNextPage, this.results});

  TopAiringModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    hasNextPage = json['hasNextPage'];
    if (json['results'] != null) {
      results = <TopAiringListModel>[];
      json['results'].forEach((v) {
        results!.add(TopAiringListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['hasNextPage'] = hasNextPage;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopAiringListModel {
  String? id;
  String? title;
  String? image;
  String? url;
  List<String>? genres;

  TopAiringListModel({this.id, this.title, this.image, this.url, this.genres});

  TopAiringListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    url = json['url'];
    genres = json['genres'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['url'] = url;
    data['genres'] = genres;
    return data;
  }
}
