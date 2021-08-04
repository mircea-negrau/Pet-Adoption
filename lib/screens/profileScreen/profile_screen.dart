import 'package:flutter/material.dart';
import 'package:pet_adoption/models/user.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  final Function openDrawer;
  final Function closeDrawer;
  final Function isDrawerOpen;

  const ProfileScreen({
    Key? key,
    required this.user,
    required this.openDrawer,
    required this.closeDrawer,
    required this.isDrawerOpen,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text("HEllo"),
    );
  }
}
