import 'package:flutter/material.dart';
import 'start_screen.dart'; // Import the start screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VR LUX',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ), // Set primary swatch to cyan
      home: StartScreen(), // Set StartScreen as the home screen
    );
  }
}
