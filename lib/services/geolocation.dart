import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationService {
  Future<void> getLocation(
      {required Function isLocationSet,
      required Function setCity,
      required Function setCountry,
      required Function setLocationLoaded,
      required Function setCoordinates,
      required Function setAddress}) async {
    if (isLocationSet() == true) {
      return;
    }
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final coordinates = Coordinates(position.latitude, position.longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    final first = addresses.first;
    final String address = "${first.locality}, ${first.countryName}";
    setCity(first.locality);
    setCountry(first.countryName);
    setAddress(address);
    setLocationLoaded();
    setCoordinates(first.coordinates);
  }

  String getDistance(String _startLatitude, String _startLongitude,
      Coordinates endCoordinates) {
    final double startLatitude = double.parse(_startLatitude);
    final double startLongitude = double.parse(_startLongitude);
    final distance = GeolocatorPlatform.instance.distanceBetween(startLatitude,
        startLongitude, endCoordinates.latitude, endCoordinates.longitude);
    final int meters = int.parse(distance.toString().split(".")[0]);
    String finalDistance;
    if (meters > 1000) {
      if (meters > 1000000) {
        finalDistance = "${(meters / 1000).toString().split(".")[0]}km";
      } else {
        final int integerPart =int.parse((meters / 1000).toString().split(".")[0]);
        final restPart = meters % 1000;
        if (restPart == 0) {
          finalDistance = "${integerPart}m";
        } else {
          final String dotPart = restPart.toString()[0];
          finalDistance = "$integerPart.${dotPart}km";
        }
      }
    } else {
      finalDistance = "${meters}m";
    }
    return finalDistance;
  }
}
