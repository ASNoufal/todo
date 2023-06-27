import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/firstscreen.dart';
import 'package:todolist/model.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ModelAdapter().typeId)) {
    Hive.registerAdapter(ModelAdapter());
  }
  box = await Hive.openBox('testBox');
  runApp(const MaterialApp(
    home: FirstScreen(),
  ));
}
