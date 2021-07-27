import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryYellow.withOpacity(0.8),
      child: Center(
          child: CircularProgressIndicator(
        backgroundColor: primaryYellow,
        color: Colors.white,
      )),
    );
  }
}
