import 'dart:developer';

import 'package:flutter/material.dart';

import '../../app/constants.dart';
import '../models/actor_deatils.dart';
import '../models/actor_images.dart';
import 'package:dio/dio.dart';

import '../models/popular_persone.dart';

class PersonRepository {
  PersonRepository._();
  static final Dio _dio = Dio();
  static final PersonRepository instance = PersonRepository._();
  static Future<PopularActors?> getPopularPeople(BuildContext context) async {
    try {
      final response = await _dio.get(Constants.getPopularPersons);
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
      final response = await _dio
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

  static Future<ActorImages?> getPersoneImagesByID(
      int id, BuildContext context) async {
    try {
      final response = await _dio.get(
          Constants.getPersonImagesById.replaceAll("person_id", id.toString()));
      if (response.statusCode == 200) {
        return ActorImages.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error : $e")));
    }
    return null;
  }
}
