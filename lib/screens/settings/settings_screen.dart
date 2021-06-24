import 'package:arc_app/auth/authentication_service.dart';
import 'package:arc_app/constants.dart';
import 'package:arc_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static String routeName = "/settings";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool doNotDisturb = false;
  String studyId = '0';
  final fb = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
    final ref = fb.reference();
    User user = FirebaseAuth.instance.currentUser!;
    ref.child(user.uid).child("study-id").once().then((data) {
      setState(() {
        studyId = data.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Column(
          children: [
            Expanded(
              child: SettingsList(
                sections: [
                  SettingsSection(
                    title: 'Profile',
                    tiles: [
                      SettingsTile(
                        title: 'Username',
                        subtitle: user.displayName,
                        onPressed: (context) {},
                      ),
                      SettingsTile(
                        title: 'Study ID',
                        subtitle: studyId,
                        onPressed: (context) {},
                      ),
                      SettingsTile(
                        title: 'Password',
                        subtitle: '*********',
                        onPressed: (context) {},
                      )
                    ],
                  ),
                  SettingsSection(
                    title: 'Notifications',
                    tiles: [
                      SettingsTile.switchTile(
                          title: 'Do Not Disturb',
                          switchValue: doNotDisturb,
                          onToggle: (value) {
                            setState(() {
                              doNotDisturb = value;
                            });
                          }),
                      SettingsTile(title: 'Preset Times'),
                      SettingsTile(title: 'Notification Type')
                    ],
                  ),
                  SettingsSection(
                    title: 'Contacts',
                    tiles: [
                      SettingsTile(
                        title: 'Emergency Contact',
                        subtitle: '123-456-7890',
                      ),
                      SettingsTile(
                        title: 'Trusted Support',
                        subtitle: '123-456-7890',
                      ),
                    ],
                  ),
                  CustomSection(
                      child: Padding(
                        padding: EdgeInsets.all(getProportionateScreenHeight(20)),
                        child: Center(
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: primary,
                            primary: Colors.white, shape: StadiumBorder()),
                        child: Padding(padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20), getProportionateScreenHeight(10), getProportionateScreenHeight(20), getProportionateScreenWidth(10)),
                        child: Text("Sign Out")),
                        onPressed: () {
                          context
                              .read<AuthenticationService>()
                              .signOut()
                              .then((value) {
                            Navigator.pop(context);
                          });
                        },
                    ),
                  ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
