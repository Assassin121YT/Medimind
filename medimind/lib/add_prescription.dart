import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settings.dart';

class AddPrescription extends StatefulWidget {
  const AddPrescription({super.key});

  @override
  State<AddPrescription> createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            DrawerHeader(
              // logo of the app
              child: Image.asset('lib/assets/images/MedimindLogoLight.png'),
            ),
            SizedBox(height: 20,),

            // back button to pop the drawer
            ListTile(
              onTap: () => Navigator.of(context).pop(),
              leading: Icon(CupertinoIcons.chevron_left, size: 35, color: Theme.of(context).colorScheme.secondary,),
              title: Text('Back', style: TextStyle(fontSize: 22, color: Theme.of(context).colorScheme.primary),),
            ),
            SizedBox(height: 20,),

            // button to go to the settings page
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Settings())),
              leading: Icon(Icons.settings, size: 35, color: Theme.of(context).colorScheme.secondary,),
              title: Text('Settings', style: TextStyle(fontSize: 22, color: Theme.of(context).colorScheme.primary),),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: const Text('Add Prescription'),
      ),
      body: const Center(
        child: Text('Add Prescription Page'),
      ),
    );
  }
}