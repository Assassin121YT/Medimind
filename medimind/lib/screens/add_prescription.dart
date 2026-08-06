import 'dart:math' as developer;


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'settings.dart';
import '../hiveModels/medicine.dart';

class AddPrescription extends StatefulWidget {
  const AddPrescription({super.key});

  @override
  State<AddPrescription> createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {

  // success dialog for when the prescription is saved successfully
  void showSuccessDialog(){
    showDialog(builder: (context) => AlertDialog(
                title: Text('Prescription Saved'),
                content: Text('The prescription has been saved successfully.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              ), context: context,);
  }

  void showErrorDialog(String errorMessage){
    showDialog(builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text(errorMessage),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              ), context: context,);
  }

  // initialize the box for use in this page
  var _prescriptions = Hive.box<Medicine>('prescriptions');

  // text editing controllers for the text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();
  final TextEditingController _timeOfDayController = TextEditingController();
  final TextEditingController _courseLengthDayController = TextEditingController();

  // boolean to check if the prescription saving process is in progress
  bool isSaving = false;

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
        centerTitle: true,
        title: const Text('Add a prescribed medication'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(height: 30,),

          // the name field
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Medication name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
            ),
          ],),
        
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _nameController,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                labelText: 'Name on the box',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            
              ),
            ),
          ),
          SizedBox(height: 30,),

          // dosage field
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Dosage', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
            ),
          ],),
        
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _dosageController,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                labelText: 'How many units per time',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            
              ),
            ),
          ),

          // frequency field
          SizedBox(height: 30,),
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Frequency', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
            ),
          ],),
        
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _frequencyController,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                labelText: 'e.g. every day, every week, every 2 days, etc...',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            
              ),
            ),
          ),

          // time field
          SizedBox(height: 30,),
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Time of day at which medicine is taken', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
            ),
          ],),
        
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _timeOfDayController,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                labelText: 'e.g. after dinner, after waking up, 6 pm, etc...',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            
              ),
            ),
          ),


          // duration field
          SizedBox(height: 30,),
          Row(children: [
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Duration of course', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
            ),
        ],),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            controller: _courseLengthDayController,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            decoration: InputDecoration(
              labelText: 'e.g. 5 days, 2 weeks, 1 month, etc...',
              labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
          
            ),
          ),
        ),

           
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isSaving ? null : () async {
              // set state to change the button to a circle progress indicator
              setState(() => isSaving = true);

              // save the prescription to the box
              await _prescriptions.add(Medicine(
                name: _nameController.text,
                dosage: _dosageController.text,
                frequency: _frequencyController.text,
                timeOfDay: _timeOfDayController.text,
                courseLengthDays: int.parse(_courseLengthDayController.text),
              ));

              print('Box now has ${_prescriptions.length} prescriptions');
              print('Last item: ${_prescriptions.values.last.name}');
              try{
              
              _nameController.clear();
              _dosageController.clear();
              _frequencyController.clear();
              _timeOfDayController.clear();
              _courseLengthDayController.clear();


              // if the user is still on the same page, present the popup
              if (mounted) {
                showSuccessDialog();
              }

            }
              catch(e){

                print('Error: $e');

                if (mounted){
                  showErrorDialog("An error occurred while saving the prescription. Please try again");
                }
              }
              finally{
                // set state to change the button back to normal
                setState(() => isSaving = false);
              }},
        child: isSaving ? SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
            strokeWidth: 3,
          ),
        ) : Icon(Icons.save),
      ));
  }
}