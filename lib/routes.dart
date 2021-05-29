import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:arc_app/screens/Sign up/sign_up_screen.dart';

// We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {
  SignUpScreen.routeName: (context) => SignUpScreen(),
};
