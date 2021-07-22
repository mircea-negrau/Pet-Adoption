import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/models/pet_card.dart';
import 'package:pet_adoption/services/cloud_firestore.dart';

class FavoritesFeed extends StatefulWidget {
  final Function openPet;
  final User user;

  const FavoritesFeed({
    Key? key,
    required this.openPet,
    required this.user,
  }) : super(key: key);

  @override
  _FavoritesFeedState createState() => _FavoritesFeedState();
}

class _FavoritesFeedState extends State<FavoritesFeed> {
  List<Widget> getPetCards(List<Pet>? pets) {
    if(pets == null) return [const Text("Empty")];
    return pets
        .map((pet) => PetCard(
              pet: pet,
              user: widget.user,
              openPet: widget.openPet,
            ))
        .toList();
  }

  Future<List<Pet>> getFavorites() async {
    final String uid = widget.user.id;
    return CloudFirestore().fetchFavorites(uid);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pet>>(
        future: getFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<Pet>? pets = snapshot.data;
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70)),
              ),
              child: Column(
                children: [
                  ...getPetCards(pets),
                  const SizedBox(height: 50.0),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
