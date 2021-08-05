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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: widget.isDrawerOpen() == true
                    ? Icon(Icons.arrow_forward_outlined,
                        size: 30.0, color: Colors.grey.shade700)
                    : Icon(Icons.arrow_back_outlined,
                        size: 30.0, color: Colors.grey.shade700),
                onPressed: () {
                  widget.isDrawerOpen() == true
                      ? widget.closeDrawer()
                      : widget.openDrawer();
                },
              ),
              IconButton(
                icon: Icon(Icons.edit, size: 30.0, color: Colors.grey.shade700),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(48, 10, 18, 0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.photoUrl!),
                    radius: 40.0,
                  ),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.user.userName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                        ),
                      ),
                      Text(
                        "Joined 2021",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 3.0,
                          fontSize: 14.0,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 25.0),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.grey[400]),
                  const SizedBox(width: 25.0),
                  Text(
                    "+40 774 015 082",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  Icon(Icons.mail, color: Colors.grey[400]),
                  const SizedBox(width: 25.0),
                  Text(
                    widget.user.email,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 26.0),
        Container(
          height: 1.0,
          color: Colors.grey[400],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "26",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    "Shares",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
              child: VerticalDivider(
                color: Colors.grey[400],
                thickness: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "3",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    "Pets",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 1.0,
          color: Colors.grey[400],
        ),
      ]),
    );
  }
}
