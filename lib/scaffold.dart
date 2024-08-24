import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'flutter',
      home: Scaffold(
          backgroundColor: Colors.black26,
          body: Center(
            child: Text('Material app',
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.purple, fontSize: 50)),
          ))));
}
