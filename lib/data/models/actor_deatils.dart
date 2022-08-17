import 'dart:convert';

class ActorDeatils {
  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  String? birthday;
  String? deathday;
  int? gender;
  dynamic homepage;
  int? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity;
  String? profilePath;

  ActorDeatils(Map map,
      {this.adult,
      this.alsoKnownAs,
      this.biography,
      this.birthday,
      this.deathday,
      this.gender,
      this.homepage,
      this.id,
      this.imdbId,
      this.knownForDepartment,
      this.name,
      this.placeOfBirth,
      this.popularity,
      this.profilePath});

  ActorDeatils.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    alsoKnownAs = json["also_known_as"] == null
        ? null
        : List<String>.from(json["also_known_as"]);
    biography = json["biography"];
    birthday = json["birthday"];
    deathday = json["deathday"];
    gender = json["gender"];
    homepage = json["homepage"];
    id = json["id"];
    imdbId = json["imdb_id"];
    knownForDepartment = json["known_for_department"];
    name = json["name"];
    placeOfBirth = json["place_of_birth"];
    popularity = json["popularity"];
    profilePath = json["profile_path"];
  }
  ActorDeatils.fromDb(Map<String, dynamic> map) {
    adult = map["adult"] == 1;
    alsoKnownAs = map["also_known_as"] == null
        ? null
        : List<String>.from(json.decode(map["also_known_as"]));
    biography = map["biography"];
    birthday = map["birthday"];
    deathday = map["deathday"];
    gender = map["gender"];
    homepage = map["homepage"];
    id = map["id"];
    imdbId = map["imdb_id"];
    knownForDepartment = map["known_for_department"];
    name = map["name"];
    placeOfBirth = map["place_of_birth"];
    popularity = map["popularity"];
    profilePath = map["profile_path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["adult"] = adult;
    if (alsoKnownAs != null) {
      data["also_known_as"] = json.encode(alsoKnownAs);
    }
    data["biography"] = biography;
    data["birthday"] = birthday;
    data["deathday"] = deathday;
    data["gender"] = gender;
    data["homepage"] = homepage;
    data["id"] = id;
    data["imdb_id"] = imdbId;
    data["known_for_department"] = knownForDepartment;
    data["name"] = name;
    data["place_of_birth"] = placeOfBirth;
    data["popularity"] = popularity;
    data["profile_path"] = profilePath;
    return data;
  }

  Map<String, dynamic> toDBmap() {
    final Map<String, dynamic> data = {};
    data["adult"] = (adult ?? false) ? 1 : 0;
    if (alsoKnownAs != null) {
      data["also_known_as"] = alsoKnownAs;
    }
    data["biography"] = biography;
    data["birthday"] = birthday;
    data["deathday"] = deathday;
    data["gender"] = gender;
    data["homepage"] = homepage;
    data["id"] = id;
    data["imdb_id"] = imdbId;
    data["known_for_department"] = knownForDepartment;
    data["name"] = name;
    data["place_of_birth"] = placeOfBirth;
    data["popularity"] = popularity;
    data["profile_path"] = profilePath;
    return data;
  }

  ActorDeatils copyWith({
    bool? adult,
    List<String>? alsoKnownAs,
    String? biography,
    String? birthday,
    String? deathday,
    int? gender,
    dynamic homepage,
    int? id,
    String? imdbId,
    String? knownForDepartment,
    String? name,
    String? placeOfBirth,
    double? popularity,
    String? profilePath,
  }) =>
      ActorDeatils({
        adult: adult ?? this.adult,
        alsoKnownAs: alsoKnownAs ?? this.alsoKnownAs,
        biography: biography ?? this.biography,
        birthday: birthday ?? this.birthday,
        deathday: deathday ?? this.deathday,
        gender: gender ?? this.gender,
        homepage: homepage ?? this.homepage,
        id: id ?? this.id,
        imdbId: imdbId ?? this.imdbId,
        knownForDepartment: knownForDepartment ?? this.knownForDepartment,
        name: name ?? this.name,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        popularity: popularity ?? this.popularity,
        profilePath: profilePath ?? this.profilePath,
      });
}
