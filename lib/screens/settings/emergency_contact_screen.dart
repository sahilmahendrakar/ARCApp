import 'package:arc_app/constants.dart';
import 'package:arc_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmergencyContactSettingsScreen extends StatefulWidget {
  const EmergencyContactSettingsScreen({ Key? key }) : super(key: key);

  @override
  _EmergencyContactSettingsScreenState createState() => _EmergencyContactSettingsScreenState();
}

class _EmergencyContactSettingsScreenState extends State<EmergencyContactSettingsScreen> {
  TextEditingController emergencyContactController = new TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
    final ref = fb.reference();
    User user = FirebaseAuth.instance.currentUser!;
    ref.child(user.uid).child("emergency-contact").once().then((data) {
      if (data.value != null) {
        setState(() {
          emergencyContactController.text = data.value;
        });
      }
    });
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
              "Edit Emergency Contact",
            )),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(20.0),
                  getProportionateScreenHeight(10.0),
                  getProportionateScreenWidth(20.0),
                  getProportionateScreenHeight(10.0)),
              child: TextField(
                controller: emergencyContactController,
                keyboardType: TextInputType.phone,
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
                  final ref = fb.reference();
                  User user = FirebaseAuth.instance.currentUser!;
                  ref
                      .child(user.uid)
                      .child("emergency-contact")
                      .set(emergencyContactController.text)
                      .then((value) => Navigator.pop(context));
                }),
          ],
        ),
      ),
    );
  }
}