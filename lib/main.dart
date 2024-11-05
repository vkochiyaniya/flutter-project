import 'package:flutter/material.dart';
import 'package:pshopapp/pages/signin.dart';
void main() {
  runApp( const MyApp(),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SignIn(),
    );
  }
}