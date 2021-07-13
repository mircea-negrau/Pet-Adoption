import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/screens/petScreen/components/bottom_buttons.dart';
import 'package:pet_adoption/screens/petScreen/components/owner_description.dart';
import 'package:pet_adoption/screens/petScreen/components/pet_details.dart';

class PetScreen extends StatelessWidget {
  final Pet pet;

  const PetScreen({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blueGrey[300],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 450.0),
                child: Hero(
                  tag: pet.id,
                  child: Image.network(pet.picture),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_outlined,
                        size: 30.0, color: Colors.grey.shade700),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.ios_share,
                        size: 30.0, color: Colors.grey.shade700),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            PetDetails(pet: pet),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: const BottomButtons(),
              ),
            ),
            const Align(
              child: OwnerDescription(),
            ),
          ],
        ),
      ),
    );
  }
}
