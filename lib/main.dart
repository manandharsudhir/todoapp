import 'package:flutter/material.dart';
import 'package:todoapp/features/homepage/view/screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
