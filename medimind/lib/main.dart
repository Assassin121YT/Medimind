import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main_page.dart';
import 'assets/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    /*
     returns a cupertino app with a material app
     inside it so that during transition between pages,
     the app uses the cupertino page transition animation
     instead of the material page transition animation
     
    */
    return MaterialApp( 
      title: "Medimind",
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      theme: lightMode.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}