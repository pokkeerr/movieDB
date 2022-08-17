import 'dart:developer';

import 'package:movedb/data/data_source/database/database_helper.dart';
import 'package:movedb/data/data_source/database/database_table.dart';
import 'package:movedb/data/models/popular_persone.dart';
import 'package:sqflite/sqflite.dart';

import '../table_coulms_args.dart';

class PopularActorsTable {
  static String tableName = "pupular_person_actor";
  static DataBabaseTable? dataBabaseTable;
  PopularActorsTable() {
    dataBabaseTable = DataBabaseTable(tableName, tableargs);
  }
  static List<TableColumsAndArgs> tableargs = [
    TableColumsAndArgs(
        'page', ["INTEGER", "PRIMARY KEY", "NOT NULL", "UNIQUE"]),
    TableColumsAndArgs('results', ["TEXT"]),
    TableColumsAndArgs('total_pages', ["INTEGER"]),
    TableColumsAndArgs('total_results', ["INTEGER"]),
  ];

  Future<bool> create(Database db) async {
    try {
      await DataBabaseTable.tableCreation(db, tableName, tableargs);
      return true;
    } catch (e) {
      log("cant careate $tableName :  ${e.toString()}");
      return false;
    }
  }

  Future<List<PopularActors>> getAll() async {
    List<PopularActors> actors = [];
    var list = await dataBabaseTable!.fetchAllitems();
    if (list != null) {
      actors =
          list.map<PopularActors>((e) => PopularActors.fromDBJson(e)).toList();
    }
    return actors;
  }

  Future<PopularActors?> getItem(int? id) async {
    if (id == null) {
      return null;
    }
    try {
      final data = await dataBabaseTable!.fetchItem(id.toString());
      if (data != null) {
        return PopularActors.fromDBJson(data);
      }
      return null;
    } catch (e) {
      log("cant get item $tableName :  ${e.toString()}");
      return null;
    }
  }

  Future<bool> fill({List<PopularActors>? items}) async {
    if (DBHelper.database != null) {
      try {
        var batch = DBHelper.database!.batch();
        items?.forEach((d) => batch.insert(tableName, d.toDBmap(),
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

  Future<int?> add(PopularActors t) async {
    try {
      return await dataBabaseTable?.addItem(t.toDBmap());
    } catch (e) {
      if (e is DatabaseException) {
        if (e.isNoSuchTableError()) {
          await create(DBHelper.database!);
          await add(t);
        }
      }
      log(e.toString());
      return null;
    }
  }
}
