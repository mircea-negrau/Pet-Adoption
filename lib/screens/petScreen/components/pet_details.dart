import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/models/pet.dart';

class PetDetails extends StatelessWidget {
  final Pet pet;

  const PetDetails({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: 135.0,
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                offset: const Offset(2, 5),
                color: Colors.grey.withOpacity(0.4),
              ),
              BoxShadow(
                blurRadius: 3,
                offset: const Offset(-2, 0),
                color: Colors.grey.withOpacity(0.4),
              )
            ],
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 10.0, 20.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
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
                  ),
                ],
              ),
              Row(
                children: [
                  Hero(
                    tag: "LOCATION${pet.id}",
                    child: Icon(
                      Icons.location_on_rounded,
                      color: primaryYellow,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Flexible(
                    child: Text(
                      pet.location,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
