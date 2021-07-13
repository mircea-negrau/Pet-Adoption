// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_adoption/screens/drawerScreen/drawer_screen.dart';
import 'package:pet_adoption/screens/homeScreen/home_screen.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/screens/loginScreen/login_screen.dart';
import 'package:pet_adoption/services/authentication.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
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
    if (user == null) return const Login();
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedView = 0;

  void setView(int index) {
    setState(() {
      selectedView = index;
    });
  }

  int getView() {
    return selectedView;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(user: user, setter: setView, getter: getView),
          HomeScreen(user: user, setter: setView, getter: getView),
        ],
      ),
    );
  }
}
