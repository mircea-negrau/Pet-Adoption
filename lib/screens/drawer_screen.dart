import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int selectedItem = 0;

  List<Widget> getDrawerItems() {
    return drawerItems
        .map((item) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 12.0, 12.0, 12.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItem = item.id;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      color: selectedItem == item.id
                          ? Colors.white
                          : Colors.white.withOpacity(0.3),
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      item.title,
                      style: TextStyle(
                          color: selectedItem == item.id
                              ? Colors.white
                              : Colors.white.withOpacity(0.3),
                          fontFamily: 'Circular',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 30.0,
        left: 20.0,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage('assets/mircea.png')),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mircea Negrau",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Circular',
                          fontSize: 17.0),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      "Active status",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 13.0,
                        fontFamily: 'Circular',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...getDrawerItems(),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.white.withOpacity(0.3),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.3),
                      fontFamily: 'Circular',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Container(
                  width: 2.0,
                  height: 20.0,
                  color: Colors.white.withOpacity(0.3),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontFamily: 'Circular',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
