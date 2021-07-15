import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/services/cloud_firestore.dart';

class BottomButtons extends StatefulWidget {
  final User user;
  final Pet pet;

  const BottomButtons({Key? key, required this.user, required this.pet})
      : super(key: key);

  @override
  _BottomButtonsState createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
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
          child: IconButton(
            icon: Icon(
              widget.user.favorites!.contains(widget.pet.id)
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: widget.user.favorites!.contains(widget.pet.id)
                  ? Colors.red
                  : Colors.white,
            ),
            onPressed: () async {
              if (widget.user.favorites!.contains(widget.pet.id)) {
                await CloudFirestore()
                    .removeUserFavorites(widget.user, widget.pet);
                widget.user.favorites!.remove(widget.pet.id);
                setState(() {});
              } else {
                await CloudFirestore()
                    .addUserFavorites(widget.user, widget.pet);
                widget.user.favorites!.insert(0, widget.pet.id);
                setState(() {});
              }
            },
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
