import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medimind/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     extendBody: false, 
     drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset('lib/assets/images/MedimindLogoLight.png'),
            ),
            SizedBox(height: 20,),
            ListTile(
              onTap: () => Navigator.of(context).pop(),
              leading: Icon(CupertinoIcons.chevron_left, size: 35, color: Theme.of(context).colorScheme.secondary,),
              title: Text('Back', style: TextStyle(fontSize: 22, color: Theme.of(context).colorScheme.primary),),
            ),
            SizedBox(height: 20,),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Settings())),
              leading: Icon(Icons.settings, size: 35, color: Theme.of(context).colorScheme.secondary,),
              title: Text('Settings', style: TextStyle(fontSize: 22, color: Theme.of(context).colorScheme.primary),),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: const Center(
        child: Text('Welcome to the Home Page'),
      ),
    );
  }
}
