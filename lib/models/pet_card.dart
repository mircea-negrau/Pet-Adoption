import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/services/geolocation.dart';

class PetCard extends StatelessWidget {
  final Function openPet;
  final Pet pet;
  final User user;
  final Coordinates coordinates;

  const PetCard(
      {Key? key,
      required this.openPet,
      required this.pet,
      required this.user,
      required this.coordinates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final distance = coordinates.longitude == 0 && coordinates.latitude == 0
        ? "TBA"
        : GeolocationService()
            .getDistance(pet.latitude, pet.longitude, coordinates);
    return GestureDetector(
      onTap: () {
        openPet(pet, user);
      },
      child: Container(
        height: 270,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 194, 205, 209),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: shadowList),
                    margin: const EdgeInsets.only(top: 40.0),
                  ),
                  Align(
                    child: Hero(
                      tag: pet.id,
                      child: Image.network(pet.picture),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 60.0, bottom: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadowList,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 28.0, 15.0, 28.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Hero(
                            tag: "NAME${pet.id}",
                            child: Text(
                              pet.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
                                color: Colors.grey[700],
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          if (pet.gender == "M")
                            Hero(
                              tag: "GENDER${pet.id}",
                              child: Icon(
                                FontAwesomeIcons.mars,
                                color: Colors.grey[500],
                                size: 30.0,
                              ),
                            )
                          else
                            Hero(
                              tag: "GENDER${pet.id}",
                              child: Icon(
                                FontAwesomeIcons.venus,
                                color: Colors.grey[500],
                                size: 30.0,
                              ),
                            )
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Hero(
                              tag: "BREED${pet.id}",
                              child: Text(
                                "${pet.breed} ${pet.type}",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Hero(
                            tag: "AGE${pet.id}",
                            child: Text(
                              "${pet.age} old",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                                decoration: TextDecoration.none,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              "Distance: $distance",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                          Hero(
                            tag: "LOCATION${pet.id}",
                            child: Icon(
                              Icons.location_on_rounded,
                              color: primaryYellow,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
