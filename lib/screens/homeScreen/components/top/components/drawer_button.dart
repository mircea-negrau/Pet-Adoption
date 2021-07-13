import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final bool isDrawerOpen;
  final Function openDrawer;
  final Function closeDrawer;

  const DrawerButton(
      {Key? key,
      required this.isDrawerOpen,
      required this.openDrawer,
      required this.closeDrawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isDrawerOpen) {
      return IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            closeDrawer();
          });
    } else {
      return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            openDrawer();
          });
    }
  }
}
