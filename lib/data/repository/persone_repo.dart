import 'dart:convert';
import 'dart:developer';

import '../../app/constants.dart';
import '../models/person_actor.dart';
import 'package:dio/dio.dart';

class PersonRepository {
  PersonRepository._();
  static final PersonRepository instance = PersonRepository._();
  static Future<List<PersonActor>> getPopularPeople() async {
    try {
      final response = await Dio().get(Constants.getPopularPersons);
      if (response.statusCode == 200) {
        final res = response.data['results'] as List<dynamic>;

        return (res).map((e) => PersonActor.fromMap(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
