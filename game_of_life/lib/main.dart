import 'package:flutter/material.dart';
import 'package:game_of_life/screens/initial_life.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialLife(),
      theme: ThemeData.dark(),
    );
  }
}
