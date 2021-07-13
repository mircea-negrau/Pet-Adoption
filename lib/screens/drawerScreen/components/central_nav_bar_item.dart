import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/models/drawer_item.dart';

class NavBarItem extends StatelessWidget {
  final int selectedItem;
  final DrawerItem item;

  const NavBarItem({Key? key, required this.item, required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        item.icon,
        color: selectedItem == item.id
            ? Colors.white
            : Colors.white.withOpacity(0.5),
        size: 20.0,
      ),
      const SizedBox(width: 30.0),
      Text(
        item.title,
        style: TextStyle(
            color: selectedItem == item.id
                ? Colors.white
                : Colors.white.withOpacity(0.5),
            fontFamily: 'Circular',
            fontWeight: FontWeight.bold,
            fontSize: 20.0),
      ),
    ]);
  }
}
