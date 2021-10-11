import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/Dashboard/dashboard_screen.dart';
import 'package:arc_app/screens/Landing/landing_screen.dart';
import 'package:arc_app/screens/Summary/summary_screen.dart';
import 'package:arc_app/screens/Surveys/anxiety_survey.dart';
import 'package:arc_app/screens/Surveys/depression_survey.dart';
import 'package:arc_app/screens/Surveys/mood_survey.dart';
import 'package:arc_app/screens/Surveys/stress_survey.dart';
import 'package:arc_app/screens/Timeline/timeline_screen.dart';
import 'package:arc_app/screens/home.dart';
import 'package:arc_app/screens/settings/settings_screen.dart';
import 'package:arc_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);
  static String routeName = "/surveyScreen";


  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final fb = FirebaseDatabase.instance;

  int _selectedIndex = 0;
  String buttonText = "NEXT";
  late PageController _pageController;

  int moodValue = 5;
  int stressValue = 5;
  int anxietyValue = 0;
  int depressionValue = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTabTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void setMoodValue(int val) {
    setState(() {
      moodValue = val;
    });
  }

  void setStressValue(int val) {
    setState(() {
      stressValue = val;
    });
  }

  void setAnxietyValue(int val) {
    setState(() {
      anxietyValue = val;
    });
  }

  void setDepressionValue(int val) {
    setState(() {
      depressionValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Expanded(
        child: PageView(
          controller: _pageController,
          children: [
            MoodSurvey(setMoodValue),
            StressSurvey(setStressValue),
            AnxietySurvey(setAnxietyValue),
            DepressionSurvey(setDepressionValue)
          ],
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
              if (index == 3) {
                buttonText = "SUBMIT";
              }
              if (index < 3) {
                buttonText = "NEXT";
              }
            });
          },
        ),
      ),
      TextButton(
        child: Text(buttonText, style: TextStyle(fontSize: 16.0)),
        onPressed: () {
          if (_selectedIndex < 3) {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.ease);
            _selectedIndex += 1;
          } else {
            // on final page, submit survey
            final ref = fb.reference();
            User user = FirebaseAuth.instance.currentUser!;
            DateTime now = DateTime.now();
            String currentDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
            ref
                .child(user.uid)
                .child("mood_data")
                .child(currentDate)
                .set(moodValue);
            ref
                .child(user.uid)
                .child("stress_data")
                .child(currentDate)
                .set(stressValue);
            ref
                .child(user.uid)
                .child("anxiety_data")
                .child(currentDate)
                .set(anxietyValue);
            ref
                .child(user.uid)
                .child("depression_data")
                .child(currentDate)
                .set(depressionValue);
            Navigator.popAndPushNamed(context, Home.routeName);
          }
        },
      ),
    ]);
  }
}
