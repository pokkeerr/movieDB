import 'package:flutter/material.dart';
import 'package:movedb/app/app.dart';
import 'package:movedb/data/data_source/database/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.deleteDb();
  await DBHelper.init();

  runApp(MyApp());
}
