import 'package:arc_app/auth/authentication_service.dart';
import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/settings/emergency_contact_screen.dart';
import 'package:arc_app/screens/settings/password_screen.dart';
import 'package:arc_app/screens/settings/studyid_screen.dart';
import 'package:arc_app/screens/settings/trusted_support_screen.dart';
import 'package:arc_app/screens/settings/username_screen.dart';
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

//TODO: Use future builder while loading data
class _SettingsScreenState extends State<SettingsScreen> {
  bool doNotDisturb = false;
  String studyId = '0';
  String emergencyContact = "None";
  String trustedSupport = "None";

  final fb = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
    final ref = fb.reference();
    User user = FirebaseAuth.instance.currentUser!;
    //Using on value instead of once() so it updates when value is changed
    ref.child(user.uid).onValue.listen((event) {
      DataSnapshot data = event.snapshot;
      setState(() {
        //The ?? performs null checking
        studyId = data.value["study-id"] ?? 0;
        emergencyContact = data.value["emergency-contact"] ?? "None";
        trustedSupport = data.value["trusted-support"] ?? "None";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          actions: [
            IconButton(
                onPressed: () {
                  //Replace with help page
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                },
                icon: Icon(Icons.help))
          ],
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
                        onPressed: (context) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UsernameSettingsScreen())).then((value) {
                            //forces page to reload when popped back, allowing values to update
                            setState(() {});
                          });
                        },
                      ),
                      SettingsTile(
                        title: 'Study ID',
                        subtitle: studyId,
                        // Uncomment code below to make study id editable
                        // onPressed: (context) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               StudyIdSettingsScreen()));
                        // },
                      ),
                      SettingsTile(
                        title: 'Password',
                        subtitle: '*********',
                        onPressed: (context) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PasswordSettingsScreen()));
                        },
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
                        subtitle: emergencyContact,
                        onPressed: (context) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmergencyContactSettingsScreen()));
                        },
                      ),
                      SettingsTile(
                        title: 'Trusted Support',
                        subtitle: trustedSupport,
                        onPressed: (context) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TrustedSupportSettingsScreen()));
                        },
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
                            primary: Colors.white,
                            shape: StadiumBorder()),
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                getProportionateScreenWidth(20),
                                getProportionateScreenHeight(10),
                                getProportionateScreenHeight(20),
                                getProportionateScreenWidth(10)),
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
