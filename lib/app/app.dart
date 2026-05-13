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
    return Container();
  }
}