import 'dart:convert';

class PopularActors {
  int? page;
  List<PopulerActorResults>? results;
  int? totalPages;
  int? totalResults;

  PopularActors(Map<Object?, Object?> map,
      {this.page, this.results, this.totalPages, this.totalResults});

  PopularActors.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    results = json["results"] == null
        ? null
        : (json["results"] as List)
            .map((e) => PopulerActorResults.fromJson(e))
            .toList();
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
  }

  PopularActors.fromDBJson(Map<String, dynamic> map) {
    page = map["page"];
    results = map["results"] == null
        ? null
        : (json.decode(map["results"]) as List)
            .map((e) => PopulerActorResults.fromDBJson(e))
            .toList();
    totalPages = map["total_pages"];
    totalResults = map["total_results"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["page"] = page;
    if (results != null) {
      data["results"] = results?.map((e) => e.toJson()).toList();
    }
    data["total_pages"] = totalPages;
    data["total_results"] = totalResults;
    return data;
  }

  Map<String, dynamic> toDBmap() {
    final Map<String, dynamic> data = {};
    data["page"] = page;
    if (results != null) {
      data["results"] = json.encode(results?.map((e) => e.toDBJson()).toList());
    }
    data["total_pages"] = totalPages;
    data["total_results"] = totalResults;
    return data;
  }

  PopularActors copyWith({
    int? page,
    List<PopulerActorResults>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      PopularActors({
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      });
}

class PopulerActorResults {
  bool? adult;
  int? gender;
  int? id;
  List<KnownFor>? knownFor;
  String? knownForDepartment;
  String? name;
  double? popularity;
  String? profilePath;

  PopulerActorResults(Map<Object?, Object?> map,
      {this.adult,
      this.gender,
      this.id,
      this.knownFor,
      this.knownForDepartment,
      this.name,
      this.popularity,
      this.profilePath});

  PopulerActorResults.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    gender = json["gender"];
    id = json["id"];
    knownFor = json["known_for"] == null
        ? null
        : (json["known_for"] as List).map((e) => KnownFor.fromJson(e)).toList();
    knownForDepartment = json["known_for_department"];
    name = json["name"];
    popularity = json["popularity"];
    profilePath = json["profile_path"];
  }

  PopulerActorResults.fromDBJson(Map<String, dynamic> map) {
    adult = map["adult"] == 1;
    gender = map["gender"];
    id = map["id"];
    knownFor = map["known_for"] == null
        ? null
        : (json.encode(map["known_for"]) as List)
            .map((e) => KnownFor.fromDBJson(e))
            .toList();
    knownForDepartment = map["known_for_department"];
    name = map["name"];
    popularity = map["popularity"];
    profilePath = map["profile_path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["adult"] = adult;
    data["gender"] = gender;
    data["id"] = id;
    if (knownFor != null) {
      data["known_for"] = knownFor?.map((e) => e.toJson()).toList();
    }
    data["known_for_department"] = knownForDepartment;
    data["name"] = name;
    data["popularity"] = popularity;
    data["profile_path"] = profilePath;
    return data;
  }

  Map<String, dynamic> toDBJson() {
    final Map<String, dynamic> data = {};
    data["adult"] = (adult ?? false) ? 1 : 0;
    data["gender"] = gender;
    data["id"] = id;
    if (knownFor != null) {
      data["known_for"] =
          json.encode(knownFor?.map((e) => e.toDBJson()).toList());
    }
    data["known_for_department"] = knownForDepartment;
    data["name"] = name;
    data["popularity"] = popularity;
    data["profile_path"] = profilePath;
    return data;
  }

  PopulerActorResults copyWith({
    bool? adult,
    int? gender,
    int? id,
    List<KnownFor>? knownFor,
    String? knownForDepartment,
    String? name,
    double? popularity,
    String? profilePath,
  }) =>
      PopulerActorResults({
        adult: adult ?? this.adult,
        gender: gender ?? this.gender,
        id: id ?? this.id,
        knownFor: knownFor ?? this.knownFor,
        knownForDepartment: knownForDepartment ?? this.knownForDepartment,
        name: name ?? this.name,
        popularity: popularity ?? this.popularity,
        profilePath: profilePath ?? this.profilePath,
      });
}

class KnownFor {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? mediaType;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  KnownFor(Map<Object?, Object?> map,
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  KnownFor.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    genreIds =
        json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]);
    id = json["id"];
    mediaType = json["media_type"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
    voteAverage = double?.tryParse(json["vote_average"].toString());
    voteCount = json["vote_count"];
  }

  KnownFor.fromDBJson(Map<String, dynamic> map) {
    adult = map["adult"] == 1;
    backdropPath = map["backdrop_path"];
    genreIds =
        map["genre_ids"] == null ? null : List<int>.from(map["genre_ids"]);
    id = map["id"];
    mediaType = map["media_type"];
    originalLanguage = map["original_language"];
    originalTitle = map["original_title"];
    overview = map["overview"];
    posterPath = map["poster_path"];
    releaseDate = map["release_date"];
    title = map["title"];
    video = map["video"];
    voteAverage = double?.tryParse(map["vote_average"].toString());
    voteCount = map["vote_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    if (genreIds != null) data["genre_ids"] = genreIds;
    data["id"] = id;
    data["media_type"] = mediaType;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }

  Map<String, dynamic> toDBJson() {
    final Map<String, dynamic> data = {};
    data["adult"] = (adult ?? false) ? 1 : 0;
    data["backdrop_path"] = backdropPath;
    if (genreIds != null) data["genre_ids"] = genreIds;
    data["id"] = id;
    data["media_type"] = mediaType;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }

  KnownFor copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? mediaType,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      KnownFor({
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        mediaType: mediaType ?? this.mediaType,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      });
}
