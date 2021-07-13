import 'package:flutter/material.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/services/cloud_firestore.dart';

class OwnerDescription extends StatelessWidget {
  final String ownerID;
  final String description;
  final String date;

  const OwnerDescription(
      {Key? key,
      required this.ownerID,
      required this.description,
      required this.date})
      : super(key: key);

  Future<User> getUser() async {
    return CloudFirestore().fetchUser(ownerID);
  }

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    return FutureBuilder<User>(
      future: user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.only(top: 315.0),
            height: 180.0,
            padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data!.photoUrl!),
                    ),
                    const SizedBox(width: 15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              snapshot.data!.name!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Owner",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            date,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        description,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 0.5,
                          fontSize: 16.0,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
