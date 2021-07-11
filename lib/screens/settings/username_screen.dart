import 'package:arc_app/constants.dart';
import 'package:arc_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UsernameSettingsScreen extends StatefulWidget {
  const UsernameSettingsScreen({Key? key}) : super(key: key);

  @override
  _UsernameScreenState createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameSettingsScreen> {
  TextEditingController usernameController = new TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
    User user = FirebaseAuth.instance.currentUser!;
    usernameController.text = user.displayName!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(getProportionateScreenHeight(10.0))),
            Center(
                child: Text(
              "Edit Username",
              textAlign: TextAlign.center,
            )),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(20.0),
                  getProportionateScreenHeight(10.0),
                  getProportionateScreenWidth(20.0),
                  getProportionateScreenHeight(10.0)),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  filled: true,
                ),
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: primary,
                    primary: Colors.white,
                    shape: StadiumBorder()),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(20),
                        getProportionateScreenHeight(5),
                        getProportionateScreenHeight(20),
                        getProportionateScreenWidth(5)),
                    child: Text("Submit")),
                onPressed: () {
                  User user = FirebaseAuth.instance.currentUser!;
                  user
                      .updateDisplayName(usernameController.text)
                      .then((value) => Navigator.pop(context));
                }),
          ],
        ),
      ),
    );
  }
}
