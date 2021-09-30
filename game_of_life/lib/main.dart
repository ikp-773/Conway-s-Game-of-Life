import 'package:flutter/material.dart';
import 'package:game_of_life/screens/initial_life.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialLife(),
      theme: ThemeData.dark(),
    ),
  );
}
