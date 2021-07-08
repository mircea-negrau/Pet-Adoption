import 'package:flutter/material.dart';
import 'package:pet_adoption/drawer_screen.dart';
import 'package:pet_adoption/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: const Color(0xFF416D6D),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
