import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllPrescriptions extends StatefulWidget {
  const AllPrescriptions({super.key});

  @override
  State<AllPrescriptions> createState() => _AllPrescriptionsState();
}

class _AllPrescriptionsState extends State<AllPrescriptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('All Prescriptions'),
      ),
      body: const Center(
        child: Text('All Prescriptions Page'),
      ),
    );
  }
}