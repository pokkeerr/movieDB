import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:movedb/data/data_source/database/table_coulms_args.dart';

import 'database_helper.dart';

class DataBabaseTable {
  final String tableName;
  final List<TableColumsAndArgs> tableSqlStatementArgs;
  static DBHelper dbHelper = DBHelper.instance();
  static Database? dataBase;

  DataBabaseTable(
    this.tableName,
    this.tableSqlStatementArgs,
  ) {
    init();
    dataBase = DBHelper.database;
  }

  static Future<Database?> init() async {
    return dataBase ??= await DBHelper.init();
  }

  static Future<void> tableCreation(
      Database? db, String table, List<TableColumsAndArgs> tableArgs) async {
    StringBuffer sb = StringBuffer("CREATE TABLE IF NOT EXISTS $table(");
    int rowIndex = 1;
    for (var t in tableArgs) {
      sb.write(t.toString());
      if (rowIndex != tableArgs.length) sb.write(', ');
      rowIndex++;
    }
    sb.write(")");
    try {
      if (db == null) {
        dataBase ??= await init();
        return await dataBase!.execute(sb.toString());
      } else {
        return await db.execute(sb.toString());
      }
    } catch (e) {
      log("**** cant create $table to the database");
      log(e.toString());
    }
  }

  Future<int> deleteTable() async {
    try {
      if (dataBase == null) await init();
      return await dataBase!.delete(tableName);
    } catch (e) {
      log("**** cant delete $tableName");
      log(e.toString());
      return 0;
    }
  }

  Future<int?> addItem(Map<String, dynamic> values) async {
    try {
      if (dataBase == null) await init();
      int res = await dataBase!.insert(tableName, values,
          conflictAlgorithm: ConflictAlgorithm.replace);
      return res;
    } catch (e) {
      if (e is DatabaseException) {
        if (e.isNoSuchTableError()) {
          // await init();
          // return await addItem(values);
        }
      }
      log("cant add to $tableName : item $values ");
      log(e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> fetchItem(String? id) async {
    if (id == null) {
      return null;
    }
    try {
      if (dataBase == null) await init();
      final maps =
          await dataBase!.query(tableName, where: "id = ?", whereArgs: [id]);
      if (maps.isNotEmpty) return maps.first;
      return null;
    } catch (e) {
      log("*** $e");
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> fetchAllitems() async {
    try {
      if (dataBase == null) await init();
      return await dataBase!.rawQuery('SELECT * FROM $tableName');
    } catch (e) {
      if (e is DatabaseException) {
        if (e.isNoSuchTableError()) {
          await tableCreation(dataBase!, tableName, tableSqlStatementArgs);
          return await fetchAllitems();
        }
      }
      log("**** cant fetch $tableName in DataBabaseTable.fetchAllitems");
      log(e.toString());
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> tableQuery(String whereStatement,
      {required bool distinct,
      required List<String> columns,
      required List<dynamic> whereArgs,
      required String groupBy,
      required String having,
      required String orderBy,
      required int limit,
      required int offset}) async {
    if (dataBase == null) await init();
    return await dataBase!.query(tableName,
        where: whereStatement,
        columns: columns,
        distinct: distinct,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        limit: limit,
        offset: offset,
        whereArgs: whereArgs);
  }
}
