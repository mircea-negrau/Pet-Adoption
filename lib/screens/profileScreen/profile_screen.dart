import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/services/authentication.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  final Function openDrawer;
  final Function closeDrawer;
  final Function isDrawerOpen;
  final Function changeView;

  const ProfileScreen({
    Key? key,
    required this.user,
    required this.openDrawer,
    required this.closeDrawer,
    required this.isDrawerOpen,
    required this.changeView,
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
        Container(
          color: Colors.grey[100],
          child: Column(
            children: [
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
                      icon: Icon(Icons.edit,
                          size: 30.0, color: Colors.grey.shade700),
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
            ],
          ),
        ),
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
        Flexible(
          child: Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.fromLTRB(48, 32, 32, 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.changeView(3);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.favorite,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "Your Favorites",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.archive,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Archived",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.settings,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  GestureDetector(
                    onTap: () async {
                      await AuthenticationService().signOut();
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.power_settings_new_rounded,
                          color: Colors.red,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "Log out",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
