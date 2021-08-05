import 'package:flutter/material.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/screens/homeScreen/components/top/components/drawer_button.dart';
import 'package:pet_adoption/screens/homeScreen/components/top/components/location_bar.dart';
import 'package:pet_adoption/screens/homeScreen/components/top/components/profile_icon.dart';

class TopNavBar extends StatelessWidget {
  final bool isDrawerOpen;
  final bool locationLoaded;
  final Function openDrawer;
  final Function closeDrawer;
  final Function setCity;
  final Function setCountry;
  final Function setLocationLoaded;
  final Function isLocationSet;
  final Function setAddress;
  final Function setCoordinates;
  final Function changeView;
  final User user;
  final String city;
  final String country;

  const TopNavBar({
    Key? key,
    required this.isDrawerOpen,
    required this.locationLoaded,
    required this.openDrawer,
    required this.closeDrawer,
    required this.setCity,
    required this.setCountry,
    required this.setLocationLoaded,
    required this.isLocationSet,
    required this.user,
    required this.city,
    required this.country,
    required this.setAddress,
    required this.setCoordinates,
    required this.changeView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DrawerButton(
            isDrawerOpen: isDrawerOpen,
            openDrawer: openDrawer,
            closeDrawer: closeDrawer,
          ),
          LocationBar(
            locationLoaded: locationLoaded,
            isLocationSet: isLocationSet,
            setCity: setCity,
            setCountry: setCountry,
            setLocationLoaded: setLocationLoaded,
            setAddress: setAddress,
            setCoordinates: setCoordinates,
            country: country,
            city: city,
          ),
          ProfileIcon(
            photoUrl: user.photoUrl.toString(),
            changeView: changeView,
          ),
        ],
      ),
    );
  }
}
