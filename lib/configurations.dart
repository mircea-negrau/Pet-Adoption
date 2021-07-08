import 'package:flutter/material.dart';

Color primaryGreen = const Color(0xFF416D6D);
List<BoxShadow> shadowList = [
  const BoxShadow(
      blurRadius: 30, offset: Offset(0, 10), color: Color(0xFFE0E0E0)),
];

List<Map> categories = [
  {'name': 'Cats', 'iconPath': 'assets/cat.png'},
  {'name': 'Dogs', 'iconPath': 'assets/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'assets/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'assets/parrot.png'},
  {'name': 'Horses', 'iconPath': 'assets/horse.png'},
];
