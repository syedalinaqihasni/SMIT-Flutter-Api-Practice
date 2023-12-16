import 'package:api_practice/screens/home_view_one.dart';
// import 'package:api_practice/screens/home_view_two.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeViewOne());
  }
}
