import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption/services/authentication.dart';

class ProfileIcon extends StatelessWidget {
  final String photoUrl;

  const ProfileIcon({Key? key, required this.photoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(0.0, 40.0),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: Row(children: const [
              Icon(FontAwesomeIcons.user),
              SizedBox(width: 10.0),
              Text('Profile'),
            ]),
          ),
          PopupMenuItem(
            child: Row(children: [
              const Icon(Icons.exit_to_app_rounded),
              const SizedBox(width: 10.0),
              GestureDetector(
                onTap: () {
                  AuthenticationService().signOut();
                },
                child: const Text('Logout'),
              ),
            ]),
          ),
        ];
      },
      child: CircleAvatar(backgroundImage: NetworkImage(photoUrl)),
    );
  }
}
