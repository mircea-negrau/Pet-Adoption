import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/models/user.dart';

class BottomButtons extends StatelessWidget {
  final User user;
  final Pet pet;

  const BottomButtons({Key? key, required this.user, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20.0),
        Container(
          height: 60.0,
          width: 70.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: primaryYellow,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(2, 5),
                color: Colors.black.withOpacity(0.6),
              )
            ],
          ),
          child: Icon(
            Icons.favorite_border,
            color: user.favorites!.contains(pet.id) ? Colors.red : Colors.white,
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: primaryYellow,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(2, 5),
                    color: Colors.black.withOpacity(0.6))
              ],
            ),
            child: const Center(
              child: Text(
                'Adoption',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
      ],
    );
  }
}
