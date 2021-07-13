import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/models/drawer_item.dart';
import 'package:pet_adoption/screens/drawerScreen/components/central_nav_bar_item.dart';

class CentralNavBar extends StatelessWidget {
  final Function setSelectedItem;
  final int selectedItem;

  const CentralNavBar(
      {Key? key, required this.setSelectedItem, required this.selectedItem})
      : super(key: key);

  GestureDetector createItem(DrawerItem item) {
    return GestureDetector(
      onTap: () {
        setSelectedItem(item);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12.0, 12.0, 12.0),
        child: NavBarItem(item: item, selectedItem: selectedItem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: drawerItems.map((item) => createItem(item)).toList(),
    );
  }
}
