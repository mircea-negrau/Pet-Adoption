import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption/services/authentication.dart';

class ThirdPartyLogin extends StatelessWidget {
  const ThirdPartyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Row(
            children: const [
              Icon(FontAwesomeIcons.facebook),
              SizedBox(width: 20.0),
              Text("Sign In"),
            ],
          ),
        ),
        const SizedBox(width: 20.0),
        ElevatedButton(
          onPressed: () async {
            print("STARTED");
            await AuthenticationService().signInWithGoogle();
            print("ENDED");
          },
          child: Row(
            children: const [
              Icon(FontAwesomeIcons.google),
              SizedBox(width: 20.0),
              Text("Sign In"),
            ],
          ),
        ),
      ],
    );
  }
}
