import 'package:flutter/material.dart';
import 'package:movedb/presentation/resources/routes_manager.dart';
import 'package:sizer/sizer.dart';

import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  //? We use this method to call the class once time on app run time
  const MyApp._internal(); //Private named constructor
  static MyApp instance =
      const MyApp._internal(); //? single instance -- singletone
  factory MyApp() => instance; //? Factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: getApplicationTheme(),
      );
    });
  }
}
