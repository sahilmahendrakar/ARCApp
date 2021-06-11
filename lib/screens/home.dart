//This is temporary, just for testing firebase authentication
import 'package:arc_app/auth/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
        children: [
          Text("Home"),
          ElevatedButton(onPressed: () {
            context.read<AuthenticationService>().signOut();
          },
          child: Text("Sign Out"),)
        ],
      )),
    );
  }
}
