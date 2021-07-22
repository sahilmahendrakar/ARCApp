import 'package:arc_app/constants.dart';
import 'package:arc_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordSettingsScreen extends StatefulWidget {
  const PasswordSettingsScreen({Key? key}) : super(key: key);

  @override
  _PasswordSettingsScreenState createState() => _PasswordSettingsScreenState();
}

class _PasswordSettingsScreenState extends State<PasswordSettingsScreen> {
  TextEditingController newPasswordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: passwordFormKey,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(getProportionateScreenHeight(10.0))),
              Center(
                  child: Text(
                "Set New Password",
              )),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(20.0),
                    getProportionateScreenHeight(10.0),
                    getProportionateScreenWidth(20.0),
                    getProportionateScreenHeight(10.0)),
                child: TextFormField(
                  controller: newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your new password';
                    }
                    return null;
                  },
                  decoration:
                      InputDecoration(filled: true, hintText: "New Password"),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(20.0),
                    getProportionateScreenHeight(10.0),
                    getProportionateScreenWidth(20.0),
                    getProportionateScreenHeight(10.0)),
                child: TextFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value != newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true, hintText: "Confirm Password"),
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
                  onPressed: () async {
                    if (passwordFormKey.currentState!.validate()) {
                      var success = true;
                      try {
                        User user = FirebaseAuth.instance.currentUser!;
                        await user.updatePassword(newPasswordController.text);
                      } on FirebaseAuthException catch (error) {
                        success = false;
                        print(error.toString());
                        if (error.code == 'weak-password')
                          await _showErrorDialog(
                              "Your password is not strong enough");
                        if (error.code == 'requires-recent-login')
                          await _showErrorDialog(
                              "Updating your password requires a recent login. Please sign out and log back in.");
                      }
                      if (success) {
                        Navigator.pop(context);
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showErrorDialog(String error_msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Failed to Update Password'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(error_msg),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OKAY'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
