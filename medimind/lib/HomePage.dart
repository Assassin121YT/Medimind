import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medimind/Settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset('lib/assets/images/MedimindLogoLight.png'),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pop(),
              leading: const Icon(CupertinoIcons.chevron_left),
              title: const Text('Back'),
            ),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const settings())),
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Home Page'),
      ),
    );
  }
}
