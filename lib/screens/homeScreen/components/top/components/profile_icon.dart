import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption/services/authentication.dart';

class ProfileIcon extends StatelessWidget {
  final String photoUrl;
  final Function changeView;

  const ProfileIcon(
      {Key? key, required this.photoUrl, required this.changeView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(0.0, 40.0),
      onSelected: (result) async {
        if (result == 0) {
          print(result);
          changeView(5);
        } else if (result == 1) {
          await AuthenticationService().signOut();
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 0,
            child: Row(children: const [
              Icon(FontAwesomeIcons.user),
              SizedBox(width: 10.0),
              Text('Profile'),
            ]),
          ),
          PopupMenuItem(
            value: 1,
            child: Row(children: const [
              Icon(Icons.exit_to_app_rounded),
              SizedBox(width: 10.0),
              Text('Logout'),
            ]),
          ),
        ];
      },
      child: CircleAvatar(backgroundImage: NetworkImage(photoUrl)),
    );
  }
}
