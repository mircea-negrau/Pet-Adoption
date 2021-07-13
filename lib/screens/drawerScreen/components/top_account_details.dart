import 'package:flutter/material.dart';
import 'package:pet_adoption/models/user.dart';

class TopAccountDetails extends StatelessWidget {
  final User user;

  const TopAccountDetails({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(backgroundImage: NetworkImage(user.photoUrl.toString())),
      const SizedBox(width: 20.0),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          user.name == null ? "John Smith" : user.name.toString(),
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontFamily: 'Circular',
            fontSize: 17.0,
          ),
        ),
        const SizedBox(height: 2.0),
        Text(
          "Online",
          style: TextStyle(
            color: Colors.white.withOpacity(0.3),
            fontSize: 13.0,
            fontFamily: 'Circular',
          ),
        ),
      ])
    ]);
  }
}
