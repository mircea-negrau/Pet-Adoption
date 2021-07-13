import 'package:flutter/material.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart' as flutter_auth;

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(45.0),
      child: Form(
        key: formKey,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60.0),
            ),
            child: TextFormField(
              autocorrect: false,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please fill this field";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Email',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  left: 25,
                  bottom: 11,
                  top: 11,
                  right: 25,
                ),
                labelStyle: TextStyle(
                  fontFamily: 'Circular',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]!.withOpacity(0.7),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60.0),
            ),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              autocorrect: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please fill this field";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Password',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                    left: 25, bottom: 11, top: 11, right: 25),
                labelStyle: TextStyle(
                  fontFamily: 'Circular',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]!.withOpacity(0.7),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (formKey.currentState!.validate()) {
                final result =
                    AuthenticationService().signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
                if (result.runtimeType == User) {
                  debugPrint("OKAY");
                } else {
                  if (result.runtimeType ==
                      flutter_auth.FirebaseAuthException) {
                    print(result);
                  }
                }
              }
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF4EA5D9)),
            ),
            child: const SizedBox(
              height: 50.0,
              child: Center(
                child: Text("Sign In", style: TextStyle(fontSize: 25.0)),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Forgot password?",
              style: TextStyle(
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
