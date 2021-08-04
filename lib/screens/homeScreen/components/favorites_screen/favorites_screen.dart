import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/models/pet_card.dart';
import 'package:geocoder/geocoder.dart';

class FavoritesFeed extends StatefulWidget {
  final Function openPet;
  final User user;
  final List<Pet> pets;
  final Coordinates coordinates;

  const FavoritesFeed({
    Key? key,
    required this.openPet,
    required this.user,
    required this.pets,
    required this.coordinates,
  }) : super(key: key);

  @override
  _FavoritesFeedState createState() => _FavoritesFeedState();
}

class _FavoritesFeedState extends State<FavoritesFeed> {
  List<Widget> getPetCards(List<Pet>? pets) {
    if (pets == null) return [const Text("Empty")];
    return pets
        .map((pet) => PetCard(
              pet: pet,
              user: widget.user,
              openPet: widget.openPet,
              coordinates: widget.coordinates,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(70), topRight: Radius.circular(70)),
      ),
      child: Column(
        children: [
          ...getPetCards(widget.pets),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
