import 'package:pet_adoption/models/drawer_item.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/screens/drawerScreen/components/top_account_details.dart';
import 'package:pet_adoption/screens/drawerScreen/components/bottom_nav_bar.dart';
import 'package:pet_adoption/screens/drawerScreen/components/central_nav_bar.dart';

class DrawerScreen extends StatefulWidget {
  final User user;

  const DrawerScreen({Key? key, required this.user}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int selectedItem = 0;

  bool setSelectedItem(DrawerItem item) {
    setState(() {
      selectedItem = item.id;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final User user = widget.user;
    return Container(
      color: primaryYellow,
      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0, left: 20.0),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopAccountDetails(user: user),
            CentralNavBar(
              setSelectedItem: setSelectedItem,
              selectedItem: selectedItem,
            ),
            const BottomNavBar(),
          ],
        ),
      ),
    );
  }
}
