import 'package:flutter/material.dart';
import 'package:arifmusic/pages/home_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arif App',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
