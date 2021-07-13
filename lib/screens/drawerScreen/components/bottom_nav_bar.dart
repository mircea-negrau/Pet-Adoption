import 'package:flutter/material.dart';
import 'package:pet_adoption/services/authentication.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        Icons.settings,
        color: Colors.white.withOpacity(0.3),
      ),
      const SizedBox(width: 20.0),
      Text(
        "Settings",
        style: TextStyle(
          color: Colors.white.withOpacity(0.3),
          fontFamily: 'Circular',
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(width: 20.0),
      Container(
        width: 2.0,
        height: 20.0,
        color: Colors.white.withOpacity(0.3),
      ),
      const SizedBox(width: 20.0),
      GestureDetector(
        onTap: () {
          AuthenticationService().signOut();
        },
        child: Text(
          "Log out",
          style: TextStyle(
            color: Colors.white.withOpacity(0.3),
            fontFamily: 'Circular',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ]);
  }
}
