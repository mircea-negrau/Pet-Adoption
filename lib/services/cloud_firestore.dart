import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/models/user.dart';

class CloudFirestore {
  Future<bool> addPet(Pet pet, File picture) async {
    final String photoURL = await uploadFile(picture);
    final newDocument = FirebaseFirestore.instance.collection("pets").doc();
    final String documentID = newDocument.id;
    await FirebaseFirestore.instance.collection("pets").doc(documentID).set({
      "id": documentID,
      "age": pet.age,
      "breed": pet.breed,
      "city": pet.location.split(", ")[0],
      "country": pet.location.split(", ")[1],
      "description": pet.description,
      "gender": pet.gender,
      "name": pet.name,
      "owner": pet.ownerID,
      "picture": photoURL,
      "type": pet.type,
      "addedDate": pet.addedDate,
      "longitude": pet.longitude,
      "latitude": pet.latitude,
    });
    return true;
  }

  Future<String> uploadFile(File file) async {
    final random = Random.secure();
    final values = List<int>.generate(15, (i) => random.nextInt(255));
    final String photoID = base64UrlEncode(values);
    late String photoURL = "";
    try {
      await FirebaseStorage.instance.ref('pets/$photoID').putFile(file);
      await Future.delayed(const Duration(milliseconds: 50));
      photoURL = await FirebaseStorage.instance
          .ref()
          .child('pets/$photoID')
          .getDownloadURL();
    } on FirebaseException catch (e) {
      debugPrint("File upload error! $e");
    }
    return photoURL;
  }

  Future<bool> addUserFavorites(User user, Pet pet) async {
    final collection = FirebaseFirestore.instance.collection('users');
    final List<String> favorites = [];
    favorites.addAll(user.favorites!);
    favorites.add(pet.id);

    await collection.doc(user.id).update(<String, dynamic>{
      "favorites": favorites,
    });
    return true;
  }

  Future<bool> removeUserFavorites(User user, Pet pet) async {
    final collection = FirebaseFirestore.instance.collection('users');
    final List<String> favorites = [];
    favorites.addAll(user.favorites!);
    favorites.remove(pet.id);

    await collection.doc(user.id).update(<String, dynamic>{
      "favorites": favorites,
    });
    return true;
  }

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
        final String longitude = doc["longitude"].toString();
        final String latitude = doc["latitude"].toString();

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
          longitude: longitude,
          latitude: latitude,
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
    final String longitude = pet["longitude"].toString();
    final String latitude = pet["latitude"].toString();
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
      longitude: longitude,
      latitude: latitude,
    );
  }

  Future<User> fetchUserDetails(String userEmail) async {
    var user;
    await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: userEmail)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) user = querySnapshot.docs.first;
    });

    if (user == null) {
      return User(id: "-1", email: "-1");
    }

    final String id = user["id"].toString();
    final String email = user["email"].toString();
    final String photoUrl = user["photoUrl"].toString();
    final String userName = user["userName"].toString();
    final String firstName = user["firstName"].toString();
    final String lastName = user["lastName"].toString();
    final favoritesList = user["favorites"] as List;
    final List<String> favorites = [];
    for (final item in favoritesList) {
      favorites.add(item.toString());
    }

    return User(
      id: id,
      email: email,
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      photoUrl: photoUrl,
      favorites: favorites,
    );
  }

  Future<bool> isUserNew(String email) async {
    var user;
    await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) user = querySnapshot.docs.first;
    });
    if (user == null) {
      return true;
    }
    return false;
  }

  Future<bool> createNewGoogleUser(auth.UserCredential userCredential) async {
    final newDocument = FirebaseFirestore.instance.collection("users").doc();
    final String documentID = newDocument.id;
    await FirebaseFirestore.instance.collection("users").doc(documentID).set({
      "id": documentID,
      "email": userCredential.user.email,
      "userName": userCredential.user.displayName,
      "firstName": userCredential.additionalUserInfo.profile["given_name"],
      "lastName": userCredential.additionalUserInfo.profile["family_name"],
      "photoUrl": userCredential.additionalUserInfo.profile["picture"],
      "favorites": [],
    });
    return true;
  }

  Future<User> fetchUser(String id) async {
    var user;
    await FirebaseFirestore.instance
        .collection("users")
        .where("id", isEqualTo: id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) user = querySnapshot.docs.first;
    });

    if (user == null) {
      return User(id: "-1", email: "-1");
    }

    return User(
        id: user["id"].toString(),
        email: user["email"].toString(),
        photoUrl: user["photoUrl"].toString(),
        userName: user["userName"].toString());
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
