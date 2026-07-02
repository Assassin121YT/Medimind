import 'package:flutter/material.dart';

/* 
color scheme for dark mode 
  primary for text,
  secondary for icons, 
  surface for background
*/

final darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: Color.fromRGBO(255, 255, 255, 1),
    secondary: Color.fromARGB(255, 169, 217, 234),
    surface: Color.fromARGB(255, 5, 4, 7)
  ),
);