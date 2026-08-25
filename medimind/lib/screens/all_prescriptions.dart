import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medimind/screens/settings.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../hiveModels/medicine.dart';

class AllPrescriptions extends StatefulWidget {
  const AllPrescriptions({super.key});

  @override
  State<AllPrescriptions> createState() => _AllPrescriptionsState();
}

class _AllPrescriptionsState extends State<AllPrescriptions> {

  final _prescriptions = Hive.box<Medicine>('prescriptions');

  @override
  Widget build(BuildContext context) {


    return Scaffold(

     // the drawer to navigate to the settings page and other pages in the future
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
        title: const Text('My prescriptions'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),

      // placeholder till the home page is implemented
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Medicine>('prescriptions').listenable(),
        builder: (context, prescriptions, _) {
          if (prescriptions.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(Icons.inbox_outlined, size: 100, color: Theme.of(context).colorScheme.primary,),
                ),
                Center(
                  child: Text('No prescriptions found.', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Text('Please add a prescription to get started.', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                ),
              ],
            );
          } else {
            return ListView.builder(
              itemCount: _prescriptions.length,
             itemBuilder: (context, index){
              final medication = _prescriptions.getAt(index);
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(medication!.name, style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                  subtitle: Text('Dosage: ${medication.dosage}, Frequency: ${medication.frequency}', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error,),
                    onPressed: () {
                      _prescriptions.deleteAt(index);
                    },
                  ),
                ),
              );
             }
            );
          }
        }
      ),);
  }
}
