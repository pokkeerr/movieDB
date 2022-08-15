import 'dart:convert';

import 'package:flutter/foundation.dart';

class PersonActor {
  bool adult;
  List<String> alsoKnownAs;
  String biography;
  DateTime birthday;
  dynamic deathday;
  int gender;
  String homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;
  PersonActor({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  PersonActor copyWith({
    bool? adult,
    List<String>? alsoKnownAs,
    String? biography,
    DateTime? birthday,
    DateTime? deathday,
    int? gender,
    String? homepage,
    int? id,
    String? imdbId,
    String? knownForDepartment,
    String? name,
    String? placeOfBirth,
    double? popularity,
    String? profilePath,
  }) {
    return PersonActor(
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
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'adult': adult});
    result.addAll({'also_known_as': alsoKnownAs});
    result.addAll({'biography': biography});
    result.addAll({'birthday': birthday.millisecondsSinceEpoch});
    result.addAll({'deathday': deathday});
    result.addAll({'gender': gender});
    result.addAll({'homepage': homepage});
    result.addAll({'id': id});
    result.addAll({'imdb_id': imdbId});
    result.addAll({'known_for_department': knownForDepartment});
    result.addAll({'name': name});
    result.addAll({'place_of_birth': placeOfBirth});
    result.addAll({'popularity': popularity});
    result.addAll({'profile_path': profilePath});

    return result;
  }

  factory PersonActor.fromMap(Map<String, dynamic> map) {
    return PersonActor(
        adult: map['adult'] ?? false,
        alsoKnownAs: List<String>.from(map['also_known_as'] ?? []),
        biography: map['biography'] ?? '',
        birthday: DateTime.fromMillisecondsSinceEpoch(
            map['birthday'] ?? DateTime.now().millisecondsSinceEpoch),
        deathday: DateTime.parse(map['deathday'] ?? DateTime.now().toString()),
        gender: map['gender']?.toInt() ?? 0,
        homepage: map['homepage'] ?? '',
        id: map['id']?.toInt() ?? 0,
        imdbId: map['imdb_id'] ?? '',
        knownForDepartment: map['known_for_department'] ?? '',
        name: map['name'] ?? '',
        placeOfBirth: map['place_of_birth'] ?? '',
        popularity: map['popularity']?.toDouble() ?? 0.0,
        profilePath: map['profile_path'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory PersonActor.fromJson(String source) =>
      PersonActor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PersonActor(adult: $adult, alsoKnownAs: $alsoKnownAs, biography: $biography, birthday: $birthday, deathday: $deathday, gender: $gender, homepage: $homepage, id: $id, imdbId: $imdbId, knownForDepartment: $knownForDepartment, name: $name, placeOfBirth: $placeOfBirth, popularity: $popularity, profilePath: $profilePath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PersonActor &&
        other.adult == adult &&
        listEquals(other.alsoKnownAs, alsoKnownAs) &&
        other.biography == biography &&
        other.birthday == birthday &&
        other.deathday == deathday &&
        other.gender == gender &&
        other.homepage == homepage &&
        other.id == id &&
        other.imdbId == imdbId &&
        other.knownForDepartment == knownForDepartment &&
        other.name == name &&
        other.placeOfBirth == placeOfBirth &&
        other.popularity == popularity &&
        other.profilePath == profilePath;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        alsoKnownAs.hashCode ^
        biography.hashCode ^
        birthday.hashCode ^
        deathday.hashCode ^
        gender.hashCode ^
        homepage.hashCode ^
        id.hashCode ^
        imdbId.hashCode ^
        knownForDepartment.hashCode ^
        name.hashCode ^
        placeOfBirth.hashCode ^
        popularity.hashCode ^
        profilePath.hashCode;
  }
}
