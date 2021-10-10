import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityScreen extends StatefulWidget {
  final String? name;
  const ActivityScreen({Key? key, this.name}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('BROOO go do your ${widget.name}. Ok good did you do it?'),
          Column(
            children: [
              TextButton(
                  onPressed: () {
                    final ref = fb.reference();
                    User user = FirebaseAuth.instance.currentUser!;
                    DateTime now = DateTime.now();
                    String currentDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
                    ref
                        .child(user.uid)
                        .child("activities")
                        .child(currentDate)
                        .set(widget.name);
                            Navigator.pop(context);
                      },
                          child: Text("YES")),
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text("NO"))
            ],
          )
        ],
      )),
    );
  }
}
