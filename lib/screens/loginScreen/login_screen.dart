import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/screens/loginScreen/components/login_form.dart';
import 'package:pet_adoption/screens/loginScreen/components/logo.dart';
import 'package:pet_adoption/screens/loginScreen/components/register_area.dart';
import 'package:pet_adoption/screens/loginScreen/components/third_party_login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 100).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryGreen,
                  primaryGreen.withOpacity(0.7),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(animation: animation),
                LoginForm(
                  passwordController: _passwordController,
                  emailController: _emailController,
                  formKey: formKey,
                ),
                const ThirdPartyLogin(),
                const SizedBox(height: 20.0),
                const RegisterArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
