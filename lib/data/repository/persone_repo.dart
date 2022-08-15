import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app/constants.dart';
import '../models/actor_deatils.dart';
import '../models/person_actor.dart';
import 'package:dio/dio.dart';

import '../models/popular_persone.dart';

class PersonRepository {
  PersonRepository._();
  static final PersonRepository instance = PersonRepository._();
  static Future<PopularActors?> getPopularPeople(BuildContext context) async {
    try {
      final response = await Dio().get(Constants.getPopularPersons);
      if (response.statusCode == 200) {
        return PopularActors.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error : $e")));
    }
    return null;
  }

  static Future<ActorDeatils?> getPersoneByID(
      int id, BuildContext context) async {
    try {
      final response = await Dio()
          .get(Constants.getPersonById.replaceAll("person_id", id.toString()));
      if (response.statusCode == 200) {
        return ActorDeatils.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error : $e")));
    }
    return null;
  }
}
