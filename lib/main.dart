import 'package:arc_app/constants.dart';
import 'package:arc_app/screens/Landing/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final ColorScheme colorScheme = ColorScheme(
    primary: Color.fromARGB(255, 100, 151, 131),
    primaryVariant: Color.fromARGB(255, 148, 179, 150),
    secondary: Color.fromARGB(255, 38, 118, 125),
    secondaryVariant: Color.fromARGB(255, 23, 74, 77),
    onBackground: Color.fromARGB(255, 234, 239, 231),
    background: Colors.white,
    surface: Color.fromARGB(255, 247, 193, 98),
    error: Color.fromARGB(255, 252, 117, 149),
    onError: Color.fromARGB(255, 252, 117, 149),
    onPrimary: Color.fromARGB(255, 234, 239, 231),
    onSecondary: Color.fromARGB(255, 234, 239, 231),
    onSurface: Color.fromARGB(255, 247, 193, 98),
    brightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Roboto",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingScreen(),
    );
  }
}
