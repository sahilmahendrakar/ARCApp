//This is temporary, just for testing firebase authentication
import 'package:arc_app/auth/authentication_service.dart';
import 'package:arc_app/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Home"),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.routeName);
              },
              child: Text("Settings")),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Text("Sign Out"),
          )
        ],
      )),
    );
  }
}
