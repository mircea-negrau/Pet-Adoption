import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/screens/homeScreen/components/pets_feed.dart';
import 'package:pet_adoption/screens/petScreen/pet_screen.dart';

import 'components/top_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  bool isFilterOpen = true;
  List selectedIndex = [];

  late String city = "";
  late String country = "";
  bool locationLoaded = false;

  void openPet(Pet pet) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PetScreen(pet: pet)));
  }

  void openDrawer() {
    xOffset = 275;
    yOffset = 125;
    scaleFactor = 0.7;
    setState(() {
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    xOffset = 0;
    yOffset = 0;
    scaleFactor = 1;
    setState(() {
      isDrawerOpen = false;
    });
  }

  bool isLocationSet() {
    return locationLoaded;
  }

  void setCity(String _city) {
    setState(() {
      city = _city;
    });
  }

  void setCountry(String _country) {
    setState(() {
      country = _country;
    });
  }

  void setLocationLoaded() {
    setState(() {
      locationLoaded = true;
    });
  }

  void toggleFilter() {
    setState(() {
      isFilterOpen = !isFilterOpen;
    });
  }

  void editFilters(int index) {
    setState(() {
      if (selectedIndex.contains(index)) {
        selectedIndex.remove(index);
      } else {
        selectedIndex.insert(0, index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = widget.user;
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
                TopNavBar(
                  openDrawer: openDrawer,
                  locationLoaded: locationLoaded,
                  country: country,
                  setCountry: setCountry,
                  isDrawerOpen: isDrawerOpen,
                  user: user,
                  isLocationSet: isLocationSet,
                  city: city,
                  closeDrawer: closeDrawer,
                  setCity: setCity,
                  setLocationLoaded: setLocationLoaded,
                ),
                const SizedBox(height: 20.0),
                PetsFeed(
                  openDrawer: openDrawer,
                  locationLoaded: locationLoaded,
                  country: country,
                  setCountry: setCountry,
                  isDrawerOpen: isDrawerOpen,
                  user: user,
                  isLocationSet: isLocationSet,
                  city: city,
                  closeDrawer: closeDrawer,
                  setCity: setCity,
                  setLocationLoaded: setLocationLoaded,
                  editFilters: editFilters,
                  selectedIndex: selectedIndex,
                  isFilterOpen: isFilterOpen,
                  openPet: openPet,
                  toggleFilter: toggleFilter,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
