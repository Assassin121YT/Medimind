import 'dart:math' as developer;


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'settings.dart';
import '../hiveModels/medicine.dart';

class AddPrescription extends StatefulWidget {
  const AddPrescription({super.key});

  @override
  State<AddPrescription> createState() => _AddPrescriptionState();
}

DateTime _selectedTime = DateTime.now();

class _AddPrescriptionState extends State<AddPrescription> {

  TimeOfDay _pickedTime = TimeOfDay.now();

  void _showTimePicker() {
  showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  ).then((value) {
    if (value == null) return; // user cancelled the picker

    final now = DateTime.now();
    DateTime combined = DateTime(
      now.year,
      now.month,
      now.day,
      value.hour,
      value.minute,
    );

    // if the picked time has already passed today, roll to tomorrow
    if (combined.isBefore(now)) {
      combined = combined.add(const Duration(days: 1));
    }

    setState(() {
      _pickedTime = value;      // keep this if you use it elsewhere for display
      _selectedTime = combined; // this is what actually gets saved
    });
  });
}

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
  final _prescriptions = Hive.box<Medicine>('prescriptions');

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')}", style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary),),
                MaterialButton(
                  onPressed: _showTimePicker,
                  child: Text('Select Time', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                ),
              ],
            ),
          ),


          // duration field
          SizedBox(height: 30,),
          Row(children: [
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Duration of course in days', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
            ),
        ],),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: _courseLengthDayController,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            decoration: InputDecoration(
              labelText: 'e.g. 5, 14, 30, etc...',
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

              if (_nameController.text.isEmpty || _dosageController.text.isEmpty || _frequencyController.text.isEmpty || _timeOfDayController.text.isEmpty || _courseLengthDayController.text.isEmpty) {
                // if any of the fields are empty, show an error dialog
                showErrorDialog("Please fill in all the fields");
                setState(() => isSaving = false);
                return;
              }

              // save the prescription to the box            keyboardType: TextInputType.number,
              await _prescriptions.add(Medicine(
                name: _nameController.text,
                dosage: _dosageController.text,
                frequency: _frequencyController.text,
                timeOfDay: _selectedTime,
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