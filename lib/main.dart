import 'package:flutter/material.dart';
import 'package:kalkulator_app/scientific.dart';
import 'binary.dart';
import 'beranda.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Beranda(),
    );
  }
}