import 'package:flutter/material.dart';
import 'package:practice/_1.dart';
import 'package:practice/bmi%20calculator.dart';
import 'package:practice/griview.dart';
import 'package:practice/login%20page.dart';
import 'package:practice/to%20do%20list.dart';
import 'package:practice/user%20form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: task(),
    );
  }
}
