import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      child: TextButton(
        child: Text('click here'),
        onPressed: () {
          print('text button tapped');
        },
        onLongPress: () {
          print('button is longpressed');
        },
      ),
    ),
  ));
  runApp(MaterialApp(
    home: Center(
      child: Container(
        child: ElevatedButton(
          child: Text('it is an elevated button'),
          onPressed: () {
            print('An elevated button is pressed.');
          },
          onLongPress: () {
            print('An elevated button is long pressed.');
          },
        ),
      ),
    ),
  ));
  runApp(MaterialApp(
    home: Center(
      child: Container(
        child: OutlinedButton(
          child: Text('it is an outlined button'),
          onPressed: () {
            print('An outlined button is pressed.');
          },
          onLongPress: () {
            print('An outlined button is long pressed.');
          },
        ),
      ),
    ),
  ));
}
