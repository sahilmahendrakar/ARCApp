import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get darkestBlue => const Color.fromARGB(255, 23, 74, 77);
  Color get secondary => const Color.fromARGB(255, 38, 118, 125);
  Color get primary => const Color.fromARGB(255, 100, 151, 131);
  Color get tertiary => const Color.fromARGB(255, 148, 179, 150);
  Color get quarternary => const Color.fromARGB(255, 234, 239, 231);
  Color get brightYellow => const Color.fromARGB(255, 247, 193, 98);
  Color get brightPink => const Color.fromARGB(255, 252, 117, 149);
  Color get pureWhite => const Color.fromARGB(255, 255, 255, 255);
  Color get pureBlack => const Color.fromARGB(255, 0, 0, 0);
}
