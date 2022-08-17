import 'package:movedb/data/data_source/database/tables/actor_deatils_table.dart';
import 'package:movedb/data/data_source/database/tables/actor_images_table.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show join;

class DBHelper {
  static const String dbName = "mainDB.db";
  static Database? database;

  DBHelper() {
    init();
  }
  static Future<void> deleteDb() async {
    await deleteDatabase(join(await getDatabasesPath(), dbName));
  }

  static DBHelper instance() => DBHelper();
  static Future<Database?> init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await ActorDeatilesTable.create(db);
      await ActorImagesTable.create(db);
      await ActorImagesTable.create(db);
      await ActorImagesTable.create(db);
    });
    return database;
  }
}
