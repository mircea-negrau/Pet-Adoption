// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_adoption/screens/drawer_screen.dart';
import 'package:pet_adoption/screens/home_screen.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/screens/login_screen.dart';
import 'package:pet_adoption/services/authentication.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.hasError);
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return Container(
            color: Colors.blueAccent,
            child: const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          );
        }
        final Stream<User> userStream = AuthenticationService().user;
        return StreamProvider<User>.value(
          value: userStream,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const Setup(),
            theme: ThemeData(
              fontFamily: 'Circular',
              primaryColor: const Color(0xFF416D6D),
            ),
          ),
        );
      },
    );
  }
}

class Setup extends StatelessWidget {
  const Setup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null || user.uid == "-1") return const Login();
    return Home();
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var user = Provider.of<User>(context);
    // if (user != null)
    //   print("From home ${user.uid}");
    // else
    //   print("NULL");
    return Scaffold(
      body: Stack(
        children: const [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
