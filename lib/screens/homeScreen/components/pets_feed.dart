import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/screens/homeScreen/components/filter_bar.dart';
import 'package:pet_adoption/screens/homeScreen/components/pet_card.dart';
import 'package:pet_adoption/screens/homeScreen/components/search_bar.dart';

class PetsFeed extends StatelessWidget {
  final bool isDrawerOpen;
  final bool isFilterOpen;
  final bool locationLoaded;
  final Function openDrawer;
  final Function closeDrawer;
  final Function setCity;
  final Function setCountry;
  final Function setLocationLoaded;
  final Function isLocationSet;
  final Function toggleFilter;
  final Function editFilters;
  final Function openPet;
  final List selectedIndex;
  final User user;
  final String city;
  final String country;

  const PetsFeed({
    Key? key,
    required this.isDrawerOpen,
    required this.isFilterOpen,
    required this.openDrawer,
    required this.closeDrawer,
    required this.locationLoaded,
    required this.setCity,
    required this.setCountry,
    required this.setLocationLoaded,
    required this.isLocationSet,
    required this.toggleFilter,
    required this.openPet,
    required this.editFilters,
    required this.selectedIndex,
    required this.user,
    required this.city,
    required this.country,
  }) : super(key: key);

  List<Widget> getPetCards() {
    return petsList
        .map((pet) => PetCard(
              pet: pet,
              openPet: openPet,
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
          SearchBar(toggleFilter: toggleFilter),
          FilterBar(
            selectedIndex: selectedIndex,
            isFilterOpen: isFilterOpen,
            editFilters: editFilters,
          ),
          ...getPetCards(),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
