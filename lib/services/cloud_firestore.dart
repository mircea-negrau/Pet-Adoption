import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/models/user.dart';

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
        final String location = "${doc["city"]}, ${doc["country"]}";
        final String owner = doc["owner"].toString();
        final String description = doc["description"].toString();
        final String addedDate = doc["addedDate"].toString();

        pets.add(Pet(
          id: id,
          name: name,
          type: type,
          breed: breed,
          gender: gender,
          age: age,
          picture: picture,
          location: location,
          ownerID: owner,
          description: description,
          addedDate: addedDate,
        ));
      });
    });
    return pets;
  }

  Future<Pet> fetchPet(String uid) async {
    var pet;
    await FirebaseFirestore.instance
        .collection('pets')
        .where("id", isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      pet = querySnapshot.docs.first;
    });
    final String id = pet["id"].toString();
    final String name = pet["name"].toString();
    final String type = pet["type"].toString();
    final String breed = pet["breed"].toString();
    final String gender = pet["gender"].toString();
    final String age = pet["age"].toString();
    final String picture = pet["picture"].toString();
    final String location = "${pet["city"]}, ${pet["country"]}";
    final String owner = pet["owner"].toString();
    final String description = pet["description"].toString();
    final String addedDate = pet["addedDate"].toString();
    return Pet(
      id: id,
      name: name,
      type: type,
      breed: breed,
      gender: gender,
      age: age,
      picture: picture,
      location: location,
      ownerID: owner,
      description: description,
      addedDate: addedDate,
    );
  }

  Future<User> fetchUserDetails(String uid) async {
    var user;
    await FirebaseFirestore.instance
        .collection("users")
        .where("id", isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      user = querySnapshot.docs.first;
    });

    final String photoUrl = user["photoUrl"].toString();
    final String name = user["userName"].toString();
    final favoritesList = user["favorites"] as List;
    final List<String> favorites = [];
    for (final item in favoritesList) {
      favorites.add(item.toString());
    }

    return User(
      uid: uid,
      photoUrl: photoUrl,
      name: name,
      favorites: favorites,
    );
  }

  Future<User> fetchUser(String uid) async {
    var user;
    await FirebaseFirestore.instance
        .collection("users")
        .where("id", isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      user = querySnapshot.docs.first;
    });
    return User(
        uid: uid,
        photoUrl: user["photoUrl"].toString(),
        name: user["userName"].toString());
  }

  Future<List<Pet>> fetchFavorites(String uid) async {
    final List<Pet> pets = [];
    await FirebaseFirestore.instance
        .collection('users')
        .where("id", isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) async {
      final user = querySnapshot.docs.first;
      final List favorites = user["favorites"] as List;
      for (final item in favorites) {
        final Pet pet = await fetchPet(item.toString());
        pets.add(pet);
      }
    });
    return pets;
  }
}
