import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/services/geolocation.dart';
import 'package:shimmer/shimmer.dart';

class LocationBar extends StatelessWidget {
  final bool locationLoaded;
  final Function isLocationSet;
  final Function setCity;
  final Function setCountry;
  final Function setLocationLoaded;
  final String country;
  final String city;

  const LocationBar(
      {Key? key,
      required this.locationLoaded,
      required this.isLocationSet,
      required this.setCity,
      required this.setCountry,
      required this.setLocationLoaded,
      required this.country,
      required this.city})
      : super(key: key);

  Row createLocationBar() {
    return Row(children: [
      Icon(
        Icons.location_on_rounded,
        color: primaryGreen,
      ),
      const SizedBox(width: 5.0),
      RichText(
        text: TextSpan(
            text: "$city, ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
              color: primaryGreen,
            ),
            children: [
              TextSpan(
                text: country,
                style: const TextStyle(fontWeight: FontWeight.normal),
              )
            ]),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "Location",
        style: TextStyle(
          color: primaryGreen.withOpacity(0.4),
          fontSize: 16.0,
        ),
      ),
      Row(children: [
        if (!locationLoaded)
          FutureBuilder(
              future: GeolocationService().getLocation(
                isLocationSet: isLocationSet,
                setCity: setCity,
                setCountry: setCountry,
                setLocationLoaded: setLocationLoaded,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return ErrorWidget(snapshot.hasError);
                }
                if (snapshot.connectionState != ConnectionState.done) {
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
                }
                return createLocationBar();
              })
        else
          createLocationBar(),
      ]),
    ]);
  }
}
