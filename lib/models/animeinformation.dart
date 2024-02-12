class AnimeInformation {
  String? id;
  String? title;
  String? url;
  List<String>? genres;
  int? totalEpisodes;
  String? image;
  String? releaseDate;
  String? description;
  String? subOrDub;
  String? type;
  String? status;
  String? otherName;
  List<Episodes>? episodes;

  AnimeInformation(
      {this.id,
      this.title,
      this.url,
      this.genres,
      this.totalEpisodes,
      this.image,
      this.releaseDate,
      this.description,
      this.subOrDub,
      this.type,
      this.status,
      this.otherName,
      this.episodes});

  AnimeInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    genres = json['genres'].cast<String>();
    totalEpisodes = json['totalEpisodes'];
    image = json['image'];
    releaseDate = json['releaseDate'];
    description = json['description'];
    subOrDub = json['subOrDub'];
    type = json['type'];
    status = json['status'];
    otherName = json['otherName'];
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(new Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['genres'] = this.genres;
    data['totalEpisodes'] = this.totalEpisodes;
    data['image'] = this.image;
    data['releaseDate'] = this.releaseDate;
    data['description'] = this.description;
    data['subOrDub'] = this.subOrDub;
    data['type'] = this.type;
    data['status'] = this.status;
    data['otherName'] = this.otherName;
    if (this.episodes != null) {
      data['episodes'] = this.episodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Episodes {
  String? id;
  int? number;
  String? url;

  Episodes({this.id, this.number, this.url});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['url'] = this.url;
    return data;
  }
}
