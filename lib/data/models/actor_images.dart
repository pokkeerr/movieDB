import 'dart:convert';

class ActorImages {
  int? id;
  List<Profiles>? profiles;

  ActorImages(Map<Object?, Object?> map, {this.id, this.profiles});

  ActorImages.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    profiles = json["profiles"] == null
        ? null
        : (json["profiles"] as List).map((e) => Profiles.fromJson(e)).toList();
  }
  ActorImages.fromDb(Map<String, dynamic> map) {
    id = map["id"];
    profiles = map["profiles"] == null
        ? null
        : (json.encode(map["profiles"]) as List)
            .map((e) => Profiles.fromDB(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    if (profiles != null) {
      data["profiles"] = profiles?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toDBMap() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    if (profiles != null) {
      data["profiles"] =
          json.encode(profiles?.map((e) => e.toDBJson()).toList());
    }
    return data;
  }

  ActorImages copyWith({
    int? id,
    List<Profiles>? profiles,
  }) =>
      ActorImages({id: id ?? this.id, profiles: profiles ?? this.profiles});
}

class Profiles {
  double? aspectRatio;
  int? height;
  dynamic iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  Profiles(Map map,
      {this.aspectRatio,
      this.height,
      this.iso6391,
      this.filePath,
      this.voteAverage,
      this.voteCount,
      this.width});

  Profiles.fromJson(Map<String, dynamic> json) {
    aspectRatio = json["aspect_ratio"];
    height = json["height"];
    iso6391 = json["iso_639_1"];
    filePath = json["file_path"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
    width = json["width"];
  }
  Profiles.fromDB(Map<String, dynamic> map) {
    aspectRatio = map["aspect_ratio"];
    height = map["height"];
    iso6391 = map["iso_639_1"];
    filePath = map["file_path"];
    voteAverage = map["vote_average"];
    voteCount = map["vote_count"];
    width = map["width"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["aspect_ratio"] = aspectRatio;
    data["height"] = height;
    data["iso_639_1"] = iso6391;
    data["file_path"] = filePath;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    data["width"] = width;
    return data;
  }

  Map<String, dynamic> toDBJson() {
    final Map<String, dynamic> data = {};
    data["aspect_ratio"] = aspectRatio;
    data["height"] = height;
    data["iso_639_1"] = iso6391;
    data["file_path"] = filePath;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    data["width"] = width;
    return data;
  }

  Profiles copyWith({
    double? aspectRatio,
    int? height,
    dynamic iso6391,
    String? filePath,
    double? voteAverage,
    int? voteCount,
    int? width,
  }) =>
      Profiles({
        aspectRatio: aspectRatio ?? this.aspectRatio,
        height: height ?? this.height,
        iso6391: iso6391 ?? this.iso6391,
        filePath: filePath ?? this.filePath,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
        width: width ?? this.width,
      });
}
