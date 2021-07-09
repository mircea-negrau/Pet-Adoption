import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = const Color(0xFF416D6D);
// Color primaryGreen = const Color.fromARGB(255, 42, 85, 84);
List<BoxShadow> shadowList = [
  BoxShadow(blurRadius: 5, offset: const Offset(5, 5), color: Colors.blueGrey.shade400),
];

List<Map<String, String>> categories = [
  {'name': 'Cats', 'iconPath': 'assets/cat.png'},
  {'name': 'Dogs', 'iconPath': 'assets/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'assets/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'assets/parrot.png'},
  {'name': 'Horses', 'iconPath': 'assets/horse.png'},
];

class DrawerItem {
  IconData icon;
  String title;
  int id;

  DrawerItem({required this.id, required this.icon, required this.title});
}

List<DrawerItem> drawerItems = [
  DrawerItem(id: 0, icon: FontAwesomeIcons.paw, title: 'Adoption'),
  DrawerItem(id: 1, icon: FontAwesomeIcons.boxOpen, title: 'Donation'),
  DrawerItem(id: 2, icon: FontAwesomeIcons.plus, title: 'Add pet'),
  DrawerItem(id: 3, icon: Icons.favorite, title: 'Favorites'),
  DrawerItem(id: 4, icon: Icons.mail, title: 'Messages'),
  DrawerItem(id: 5, icon: FontAwesomeIcons.userAlt, title: 'Profile'),
];
