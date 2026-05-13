import 'package:clean_architect/presentation/resources/route_manager.dart';
import 'package:clean_architect/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  static final MyApp _instance = MyApp._();

  const MyApp._();

  factory MyApp.instance() => _instance;
  
  @override
  State<StatefulWidget> createState() => _MyAppState();

  
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getAppTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}