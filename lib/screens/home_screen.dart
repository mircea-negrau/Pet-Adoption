import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/screens/pet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  bool isFilterOpen = false;
  int selectedIndex = 0;

  List<Widget> getPetOverviews() {
    return petsList
        .map((pet) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PetScreen(pet: pet)));
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
                              child: Image.asset(pet.picture),
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
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 28.0, 15.0, 28.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Hero(
                                    tag: "NAME${pet.id}",
                                    child: Text(
                                      pet.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28.0,
                                        color: Colors.grey[700],
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
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Distance: ${pet.distance}",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                  Hero(
                                    tag: "LOCATION${pet.id}",
                                    child: Icon(
                                      Icons.location_on_rounded,
                                      color: primaryGreen,
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
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isDrawerOpen ? 70.0 : 0.0),
        color: Colors.grey[100],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isDrawerOpen ? 70.0 : 0.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isDrawerOpen)
                        IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              setState(() {
                                isDrawerOpen = false;
                              });
                            })
                      else
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            xOffset = 275;
                            yOffset = 125;
                            scaleFactor = 0.7;
                            setState(() {
                              isDrawerOpen = true;
                            });
                          },
                        ),
                      Column(children: [
                        Text("Location",
                            style: TextStyle(
                                color: primaryGreen.withOpacity(0.4),
                                fontSize: 16.0)),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: primaryGreen,
                            ),
                            const SizedBox(width: 5.0),
                            RichText(
                              text: TextSpan(
                                text: "Oradea, ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: primaryGreen,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Romania",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ]),
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/mircea.png'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.search,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(width: 15.0),
                                Text(
                                  "Search pet to adopt",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.tune_rounded,
                                color: Colors.grey[400],
                              ),
                              onTap: () {
                                setState(() {
                                  isFilterOpen = !isFilterOpen;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      if (isFilterOpen)
                        Container(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          margin:
                                              const EdgeInsets.only(left: 20),
                                          decoration: BoxDecoration(
                                            color: index == selectedIndex
                                                ? primaryGreen
                                                : Colors.white,
                                            boxShadow: shadowList,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.asset(
                                            categories[index]['iconPath']!,
                                            height: 50.0,
                                            width: 50.0,
                                            color: index == selectedIndex
                                                ? Colors.white
                                                : Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 7.0),
                                        Row(children: [
                                          const SizedBox(width: 20.0),
                                          Text(categories[index]['name']!)
                                        ]),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ...getPetOverviews(),
                      const SizedBox(height: 50.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
