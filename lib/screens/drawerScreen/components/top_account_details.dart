import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';
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
          user.userName == null ? "John Smith" : user.userName.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Circular',
            fontSize: 17.0,
          ),
        ),
        const SizedBox(height: 2.0),
        Row(
          children: [
            CircleAvatar(backgroundColor: primaryGreen, radius: 5.0),
            const SizedBox(width: 5.0),
            Text(
              "Online",
              style: TextStyle(
                color: primaryGrey,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ])
    ]);
  }
}
