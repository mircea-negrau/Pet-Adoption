import 'package:flutter/material.dart';

class RegisterArea extends StatelessWidget {
  const RegisterArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Don't have an account?  ",
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.grey.shade300.withOpacity(0.5),
        ),
        children: [
          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.6),
            ),
          )
        ],
      ),
    );
  }
}
