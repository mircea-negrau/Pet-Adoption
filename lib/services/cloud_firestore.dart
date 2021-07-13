import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_adoption/models/pet.dart';

class CloudFirestore {
  Future<List<Pet>> fetchPets() async {
    final List<Pet> pets = [];
    await FirebaseFirestore.instance
        .collection('pets')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        final String id = doc["id"].toString();
        final String name = doc["name"].toString();
        final String type = doc["type"].toString();
        final String breed = doc["breed"].toString();
        final String gender = doc["gender"].toString();
        final String age = doc["age"].toString();
        final String picture = doc["picture"].toString();
        final String location = doc["location"].toString();

        pets.add(Pet(
            id: id,
            name: name,
            type: type,
            breed: breed,
            gender: gender,
            age: age,
            picture: picture,
            location: location));
      });
    });
    return pets;
  }
}
