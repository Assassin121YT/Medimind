import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPrescription extends StatefulWidget {
  const AddPrescription({super.key});

  @override
  State<AddPrescription> createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Add Prescription'),
      ),
      body: const Center(
        child: Text('Add Prescription Page'),
      ),
    );
  }
}