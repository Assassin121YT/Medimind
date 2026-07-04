import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main_page.dart';
import 'assets/themes/light_mode.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hiveModels/medicine.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); // ensures that the flutter engine is initialized before running the app

  // initialize Hive
  await Hive.initFlutter();

  Hive.registerAdapter(MedicineAdapter()); // register the Medicine adapter
  await Hive.openBox<Medicine>('prescriptions');

  // initialize hive box for storing the prescriptions
  var box = await Hive.openBox('prescriptions');

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