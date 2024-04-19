import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'homepage.dart';
import 'time_of_day_adapter.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(TimeOfDayAdapter());

  // Open the Hive box
  await Hive.openBox('mybox');

  runApp(MaterialApp(home: HomePage(),debugShowCheckedModeBanner: false,theme: ThemeData(primaryColor: Colors.white),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold();
  }
}
