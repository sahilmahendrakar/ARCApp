import 'package:flutter/widgets.dart';
import 'package:arc_app/constants.dart';
import 'package:flutter/material.dart';

class SignUpCard extends StatefulWidget {
  @override
  _SignUpCardState createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 25.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12.withAlpha(15),
                  labelText: "Study ID"),
            ),
            Padding(padding: const EdgeInsets.all(15.0)),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12.withAlpha(15),
                  labelText: "Create a Password"),
            ),
            Padding(padding: const EdgeInsets.all(15.0)),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12.withAlpha(15),
                  labelText: "Confirm Password"),
            ),
            Padding(padding: const EdgeInsets.all(15.0)),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12.withAlpha(15),
                  labelText: "Username"),
            ),
            Padding(padding: const EdgeInsets.all(15.0)),
            TextButton(
              onPressed: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 50.0),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: brightYellow,
                  shape: StadiumBorder()),
            )
          ],
        ),
      ),
    );
  }
}
