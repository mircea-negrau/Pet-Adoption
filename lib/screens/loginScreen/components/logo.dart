import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Animation<double> animation;

  const Logo({Key? key, required this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: animation.value,
      width: animation.value,
      child: Image.asset(
        'assets/logo.png',
        color: Colors.white,
      ),
    );
  }
}
