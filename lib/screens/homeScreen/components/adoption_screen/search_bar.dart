import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBar extends StatelessWidget {
  final Function toggleFilter;

  const SearchBar({Key? key, required this.toggleFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          Icon(FontAwesomeIcons.search, color: Colors.grey[400]),
          const SizedBox(width: 15.0),
          Text(
            "Search pet to adopt",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
            ),
          ),
        ]),
        GestureDetector(
          onTap: () {
            toggleFilter();
          },
          child: Icon(Icons.tune_rounded, color: Colors.grey[400]),
        ),
      ]),
    );
  }
}
