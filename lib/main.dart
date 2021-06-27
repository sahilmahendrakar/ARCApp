import 'package:arc_app/auth/authentication_wrapper.dart';
import 'package:arc_app/constants.dart';
import 'package:arc_app/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/authentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null,
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ARC app',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: colorScheme.primary,
            accentColor: colorScheme.secondary,
            inputDecorationTheme: InputDecorationTheme(
                //labelStyle: TextStyle(color: colorScheme.primary),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorScheme.primary)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorScheme.primary)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorScheme.primary))),
            fontFamily: "Roboto",
            textTheme: TextTheme(
              bodyText1: TextStyle(color: kTextColor),
              bodyText2: TextStyle(color: kTextColor),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: AuthenticationWrapper.routeName,
          routes: routes,
        ));
  }
}
