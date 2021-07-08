import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/pet_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40.0 : 0.0),
        color: Colors.grey[100],
      ),
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
                          SizedBox(
                            width: 5.0,
                          ),
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
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
                  borderRadius: BorderRadius.circular(40),
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
                                        margin: const EdgeInsets.only(left: 20),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PetScreen()));
                      },
                      child: Container(
                        height: 240,
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        boxShadow: shadowList),
                                    margin: const EdgeInsets.only(top: 40.0),
                                  ),
                                  Align(
                                    child: Hero(
                                        tag: 1,
                                        child:
                                            Image.asset('assets/pet-cat2.png')),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 60.0, bottom: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: shadowList,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 240,
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.orange[100],
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: shadowList),
                                  margin: const EdgeInsets.only(top: 40.0),
                                ),
                                Align(
                                  child: Image.asset('assets/pet-cat1.png'),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 60.0, bottom: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
