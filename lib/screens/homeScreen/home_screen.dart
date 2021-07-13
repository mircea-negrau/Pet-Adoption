import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/screens/homeScreen/components/adoption_screen/adoption_feed.dart';
import 'package:pet_adoption/screens/homeScreen/components/favorites_screen/favorites_feed.dart';
import 'package:pet_adoption/screens/homeScreen/components/top/top_nav_bar.dart';
import 'package:pet_adoption/screens/petScreen/pet_screen.dart';
import 'package:pet_adoption/services/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pet_adoption/configurations.dart' as config;

class HomeScreen extends StatefulWidget {
  final User user;
  final Function setView;
  final Function getView;
  final Function isDrawerOpen;
  final Function openDrawer;
  final Function closeDrawer;
  final Function getOffsetX;
  final Function getOffsetY;
  final Function getScaleFactor;

  const HomeScreen(
      {Key? key,
      required this.user,
      required this.setView,
      required this.getView,
      required this.openDrawer,
      required this.closeDrawer,
      required this.isDrawerOpen,
      required this.getOffsetX,
      required this.getOffsetY,
      required this.getScaleFactor})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFilterOpen = true;
  bool locationLoaded = false;
  bool petsLoaded = false;

  List<Pet> allPets = [];
  List<int> selectedFilterIndexes = [];
  List<Pet> filteredPets = [];

  late String city = "";
  late String country = "";

  void openPet(Pet pet, User user) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PetScreen(
                  pet: pet,
                  user: user,
                )));
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
    final double xOffset = widget.getOffsetX() as double;
    final double yOffset = widget.getOffsetY() as double;
    final double scaleFactor = widget.getScaleFactor() as double;
    final Function isDrawerOpen = widget.isDrawerOpen;
    final Function openDrawer = widget.openDrawer;
    final Function closeDrawer = widget.closeDrawer;
    final bool drawerIsOpen = isDrawerOpen() as bool;
    return AnimatedContainer(
      constraints: const BoxConstraints.expand(),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(drawerIsOpen ? 70.0 : 0.0),
        color: Colors.grey[100],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(drawerIsOpen ? 70.0 : 0.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: fetchView(openDrawer, closeDrawer, isDrawerOpen),
          ),
        ),
      ),
    );
  }

  Widget fetchView(
    Function openDrawer,
    Function closeDrawer,
    Function isDrawerOpen,
  ) {
    final User user = widget.user;
    final int selectedMenuIndex = widget.getView() as int;
    switch (selectedMenuIndex) {
      case 0:
        return getAdoptionScreen(user, openDrawer, closeDrawer, isDrawerOpen);
      case 1:
        return getDonationScreen(user, openDrawer, closeDrawer, isDrawerOpen);
      case 2:
        return getAddPetScreen(user, openDrawer, closeDrawer, isDrawerOpen);
      case 3:
        return getFavoritesScreen(user, openDrawer, closeDrawer, isDrawerOpen);
      case 4:
        return getMessagesScreen(user, openDrawer, closeDrawer, isDrawerOpen);
      case 5:
        return getProfileScreen(user, openDrawer, closeDrawer, isDrawerOpen);
      default:
        return Container();
    }
  }

  List<Widget> getTopBar(
    User user,
    Function openDrawer,
    Function closeDrawer,
    Function isDrawerOpen,
  ) {
    return [
      const SizedBox(height: 20.0),
      TopNavBar(
        openDrawer: openDrawer,
        locationLoaded: locationLoaded,
        country: country,
        setCountry: setCountry,
        isDrawerOpen: isDrawerOpen() as bool,
        user: user,
        isLocationSet: isLocationSet,
        city: city,
        closeDrawer: closeDrawer,
        setCity: setCity,
        setLocationLoaded: setLocationLoaded,
      ),
      const SizedBox(height: 20.0)
    ];
  }

  Column getAdoptionScreen(
    User user,
    Function openDrawer,
    Function closeDrawer,
    Function isDrawerOpen,
  ) {
    return Column(
      children: [
        ...getTopBar(user, openDrawer, closeDrawer, isDrawerOpen),
        if (!petsLoaded)
          FutureBuilder(
              future: fetchPets(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.hasError) {
                  return ErrorWidget(snapshot.hasError);
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return AdoptionFeed(
                    openDrawer: openDrawer,
                    locationLoaded: locationLoaded,
                    country: country,
                    setCountry: setCountry,
                    isDrawerOpen: isDrawerOpen() as bool,
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
          AdoptionFeed(
            openDrawer: openDrawer,
            locationLoaded: locationLoaded,
            country: country,
            setCountry: setCountry,
            isDrawerOpen: isDrawerOpen() as bool,
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
          ),
      ],
    );
  }

  Column getDonationScreen(
    User user,
    Function openDrawer,
    Function closeDrawer,
    Function isDrawerOpen,
  ) {
    return Column(
      children: [
        ...getTopBar(user, openDrawer, closeDrawer, isDrawerOpen),
      ],
    );
  }

  Column getAddPetScreen(
    User user,
    Function openDrawer,
    Function closeDrawer,
    Function isDrawerOpen,
  ) {
    return Column(
      children: [
        ...getTopBar(user, openDrawer, closeDrawer, isDrawerOpen),
      ],
    );
  }

  Column getFavoritesScreen(
    User user,
    Function openDrawer,
    Function closeDrawer,
    Function isDrawerOpen,
  ) {
    return Column(
      children: [
        ...getTopBar(user, openDrawer, closeDrawer, isDrawerOpen),
        FavoritesFeed(openPet: openPet, user: user),
      ],
    );
  }

  Column getMessagesScreen(
    User user,
    Function openDrawer,
    Function closeDrawer,
    Function isDrawerOpen,
  ) {
    return Column(
      children: [
        ...getTopBar(user, openDrawer, closeDrawer, isDrawerOpen),
      ],
    );
  }

  Column getProfileScreen(
    User user,
    Function openDrawer,
    Function closeDrawer,
    Function isDrawerOpen,
  ) {
    return Column(
      children: [
        ...getTopBar(user, openDrawer, closeDrawer, isDrawerOpen),
      ],
    );
  }
}
