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
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  void setView(int index) {
    setState(() {
      selectedView = index;
    });
  }

  int getView() {
    return selectedView;
  }

  void openDrawer() {
    setState(() {
      xOffset = 275;
      yOffset = 125;
      scaleFactor = 0.7;
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  bool getDrawerStatus() {
    return isDrawerOpen;
  }

  double getScaleFactor() {
    return scaleFactor;
  }

  double getOffsetY() {
    return yOffset;
  }

  double getOffsetX() {
    return xOffset;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(
              user: user,
              setView: setView,
              getView: getView,
              openDrawer: openDrawer,
              closeDrawer: closeDrawer),
          HomeScreen(
            user: user,
            setView: setView,
            getView: getView,
            openDrawer: openDrawer,
            closeDrawer: closeDrawer,
            isDrawerOpen: getDrawerStatus,
            getScaleFactor: getScaleFactor,
            getOffsetY: getOffsetY,
            getOffsetX: getOffsetX,
          ),
        ],
      ),
    );
  }
}
