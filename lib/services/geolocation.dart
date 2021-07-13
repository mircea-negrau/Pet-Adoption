import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationService {
  Future<void> getLocation(
      {required Function isLocationSet,
      required Function setCity,
      required Function setCountry,
      required Function setLocationLoaded}) async {
    if (isLocationSet() == true) {
      return;
    }
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final coordinates = Coordinates(position.latitude, position.longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    final first = addresses.first;
    setCity(first.locality);
    setCountry(first.countryName);
    setLocationLoaded();
  }

  Future<void> getLocationName (double latitude, double longitude) async {
    final coordinates = Coordinates(latitude, longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    print(addresses.first.locality);
  }
}
