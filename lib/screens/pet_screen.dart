import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption/configurations.dart';

class PetScreen extends StatelessWidget {
  final Pet pet;

  const PetScreen({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blueGrey[300],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 450.0),
                child: Hero(
                  tag: pet.id,
                  child: Image.asset(pet.picture),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_outlined,
                        size: 30.0, color: Colors.grey.shade700),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.ios_share,
                        size: 30.0, color: Colors.grey.shade700),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Align(
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
                              color: primaryGreen,
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0),
                    Container(
                      height: 60.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: primaryGreen,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: const Offset(2, 5),
                            color: Colors.black.withOpacity(0.6),
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                offset: const Offset(2, 5),
                                color: Colors.black.withOpacity(0.6))
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Adoption',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                  ],
                ),
              ),
            ),
            Align(
              child: Container(
                margin: const EdgeInsets.only(top: 315.0),
                height: 180.0,
                padding: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/mircea.png'),
                        ),
                        SizedBox(width: 15.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Mircea Negrau",
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
                                "May 26, 2019",
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
                            "My job requires moving to another country. I don't have the opportunity to take the cat with me. I am looking for good people who will shelter my Sola.",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
