import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/screens/homeScreen/components/pets_feed.dart';
import 'package:pet_adoption/screens/petScreen/pet_screen.dart';
import 'package:pet_adoption/services/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pet_adoption/configurations.dart' as config;
import 'components/top_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  final Function setter;
  final Function getter;

  const HomeScreen(
      {Key? key,
      required this.user,
      required this.setter,
      required this.getter})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  bool isFilterOpen = true;
  bool locationLoaded = false;
  bool petsLoaded = false;

  List<Pet> allPets = [];
  List<int> selectedFilterIndexes = [];
  List<Pet> filteredPets = [];

  late String city = "";
  late String country = "";

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
      if (selectedFilterIndexes.contains(index)) {
        selectedFilterIndexes.remove(index);
      } else {
        selectedFilterIndexes.insert(0, index);
      }
      if (selectedFilterIndexes.isEmpty) {
        filteredPets = allPets;
      } else {
        final List<String> activeFilters = [];
        for (final int index in selectedFilterIndexes) {
          activeFilters.add(config.filtersName[index]!);
        }
        final List<Pet> newList = [];
        for (final Pet pet in allPets) {
          if (activeFilters.contains(pet.type)) {
            newList.add(pet);
          }
        }
        filteredPets = newList;
      }
    });
  }

  Future<void> fetchPets() async {
    allPets = await CloudFirestore().fetchPets();
    setState(() {
      filteredPets = allPets;
      petsLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      constraints: const BoxConstraints.expand(),
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
            child: fetchView(),
          ),
        ),
      ),
    );
  }

  Widget fetchView() {
    final User user = widget.user;
    final int selectedMenuIndex = widget.getter() as int;
    if (selectedMenuIndex == 0) {
      return Column(
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
          if (!petsLoaded)
            FutureBuilder(
                future: fetchPets(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.hasError) {
                    return ErrorWidget(snapshot.hasError);
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return createPetsFeed(user: user);
                  }
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150.0,
                            height: 15.0,
                            color: Colors.white,
                          ),
                        ]),
                  );
                })
          else
            createPetsFeed(user: user),
        ],
      );
    } else {
      return Column(
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
        ],
      );
    }
  }

  PetsFeed createPetsFeed({required User user}) {
    return PetsFeed(
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
      selectedIndex: selectedFilterIndexes,
      isFilterOpen: isFilterOpen,
      openPet: openPet,
      toggleFilter: toggleFilter,
      pets: filteredPets,
    );
  }
}
