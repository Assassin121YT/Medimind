import 'package:flutter/material.dart';

/* 
color scheme for light mode 
  primary for text,
  secondary for icons, 
  surface for background
*/

final lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Color.fromARGB(255, 0, 34, 66),
    secondary: Color.fromARGB(255, 169, 217, 234),
    surface: Color.fromARGB(255, 254, 254, 254),
  ),
);