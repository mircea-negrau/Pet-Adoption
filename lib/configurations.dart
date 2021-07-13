import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption/models/drawer_item.dart';

Color primaryYellow = const Color(0xFFECCB57);
Color primaryGreen = const Color(0xFF5C946E);
Color primaryGrey = const Color(0xFF170312).withOpacity(0.5);

List<BoxShadow> shadowList = [
  BoxShadow(
      blurRadius: 5, offset: const Offset(5, 5), color: Colors.grey.shade400),
];

Map<int, String> filtersName = {
  0: "cat",
  1: "dog",
  2: "bunny",
  3: "parrot",
  4: "horse",
};

List<Map<String, String>> categories = [
  {'name': 'Cats', 'iconPath': 'assets/cat.png'},
  {'name': 'Dogs', 'iconPath': 'assets/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'assets/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'assets/parrot.png'},
  {'name': 'Horses', 'iconPath': 'assets/horse.png'},
];

List<DrawerItem> drawerItems = [
  DrawerItem(id: 0, icon: FontAwesomeIcons.paw, title: 'Adoption'),
  DrawerItem(id: 1, icon: FontAwesomeIcons.boxOpen, title: 'Donation'),
  DrawerItem(id: 2, icon: FontAwesomeIcons.plus, title: 'Add pet'),
  DrawerItem(id: 3, icon: Icons.favorite, title: 'Favorites'),
  DrawerItem(id: 4, icon: Icons.mail, title: 'Messages'),
  DrawerItem(id: 5, icon: FontAwesomeIcons.userAlt, title: 'Profile'),
];
