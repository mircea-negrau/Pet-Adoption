import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = const Color(0xFF2D5557);

List<BoxShadow> shadowList = [
  BoxShadow(
      blurRadius: 5,
      offset: const Offset(5, 5),
      color: Colors.grey.shade400),
];

List<Map<String, String>> categories = [
  {'name': 'Cats', 'iconPath': 'assets/cat.png'},
  {'name': 'Dogs', 'iconPath': 'assets/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'assets/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'assets/parrot.png'},
  {'name': 'Horses', 'iconPath': 'assets/horse.png'},
];

class DrawerItem {
  int id;
  String title;
  IconData icon;

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

List<Pet> petsList = [
  Pet(
    id: "PET001",
    name: "Rocky",
    gender: "M",
    type: "parrot",
    breed: "Brazilian",
    distance: "592.1 km",
    picture: "assets/pet-parrot1.png",
    age: "2 years",
    location: "33 Nuevo Street, Rui Rocha",
  ),
  Pet(
    id: "PET002",
    name: "Orion",
    gender: "M",
    type: "cat",
    breed: "Russian",
    distance: "3.6 km",
    picture: "assets/pet-cat2.png",
    age: "9 months",
    location: "15 Petofi Sandor Street, Debrecen",
  ),
  Pet(
    id: "PET003",
    name: "Kayla",
    gender: "F",
    type: "dog",
    breed: "Golden Retriever",
    distance: "350 m",
    picture: "assets/pet-dog1.png",
    age: "1.5 years",
    location: "17 Alexandru Makedon Street, Oradea",
  ),
  Pet(
    id: "PET004",
    name: "White",
    gender: "M",
    type: "cat",
    breed: "Abyssinian",
    distance: "7.8 km",
    picture: "assets/pet-cat1.png",
    age: "2 years",
    location: "5 Bulvarno-Kudriavska Street, Kyiv",
  ),
  Pet(
    id: "PET005",
    name: "Jackson",
    gender: "M",
    type: "horse",
    breed: "French Pure-blood",
    distance: "107.8 km",
    picture: "assets/pet-horse1.png",
    age: "8 years",
    location: "9 Louvre Street, Paris",
  ),
];

class Pet {
  String id;
  String name;
  String gender;
  String type;
  String breed;
  String distance;
  String picture;
  String age;
  String location;

  Pet({
    required this.id,
    required this.name,
    required this.gender,
    required this.type,
    required this.breed,
    required this.distance,
    required this.picture,
    required this.age,
    required this.location,
  });
}
