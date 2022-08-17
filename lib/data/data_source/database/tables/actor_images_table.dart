import 'dart:developer';

import 'package:movedb/data/data_source/database/database_helper.dart';
import 'package:movedb/data/data_source/database/database_table.dart';
import 'package:movedb/data/models/actor_images.dart';
import 'package:sqflite/sqflite.dart';

import '../table_coulms_args.dart';

class ActorImagesTable {
  static String tableName = "actore_images";
  static DataBabaseTable? dataBabaseTable;
  ActorImagesTable() {
    dataBabaseTable = DataBabaseTable(tableName, tableargs);
  }
  static List<TableColumsAndArgs> tableargs = [
    TableColumsAndArgs('id', ["INTEGER", "PRIMARY KEY", "NOT NULL", "UNIQUE"]),
    TableColumsAndArgs('profiles', ["TEXT"]),
  ];

  static Future<bool> create(Database db) async {
    try {
      await DataBabaseTable.tableCreation(db, tableName, tableargs);
      return true;
    } catch (e) {
      log("cant careate $tableName :  ${e.toString()}");
      return false;
    }
  }

  static Future<List<ActorImages>> getAll() async {
    List<ActorImages> actors = [];
    var list = await dataBabaseTable!.fetchAllitems();
    if (list != null) {
      actors = list.map<ActorImages>((e) => ActorImages.fromDb(e)).toList();
    }
    return actors;
  }

  static Future<ActorImages?> getItem(int? id) async {
    if (id == null) {
      return null;
    }
    try {
      final data = await dataBabaseTable!.fetchItem(id.toString());
      if (data != null) {
        return ActorImages.fromDb(data);
      }
      return null;
    } catch (e) {
      log("cant get item $tableName :  ${e.toString()}");
      return null;
    }
  }

  Future<bool> fill({List<ActorImages>? items}) async {
    if (DBHelper.database != null) {
      try {
        var batch = DBHelper.database!.batch();
        items?.forEach((d) => batch.insert(tableName, d.toDBMap(),
            conflictAlgorithm: ConflictAlgorithm.replace));
        if (DBHelper.database?.isOpen ?? false) await batch.commit();
        return true;
      } catch (e) {
        if (e is DatabaseException) {
          if (e.isNoSuchTableError()) {
            await create(DBHelper.database!);
            return await fill(items: items);
          }
        }
      }
      return false;
    } else {
      DBHelper.init();
      return await fill(items: items);
    }
  }

  Future<int?> add(ActorImages t) async {
    return await dataBabaseTable!.addItem(t.toDBMap());
  }
}
