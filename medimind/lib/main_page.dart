import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'screens/home_page.dart';
import 'screens/add_prescription.dart';
import 'screens/all_prescriptions.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  void _navigateToPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const AddPrescription(),
    const AllPrescriptions(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 22.0),
          child: GNav(
            onTabChange: _navigateToPage,
            rippleColor: Theme.of(context).colorScheme.surface,
            tabBorder: Border.all(color: Theme.of(context).colorScheme.primary, width: 5),
            gap: 8,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            color: Theme.of(context).colorScheme.primary,
            activeColor: Theme.of(context).colorScheme.surface,
            tabBackgroundColor: Theme.of(context).colorScheme.primary, 
            padding: const EdgeInsets.all(20),
            tabs:[
              GButton(
                icon: Icons.home_rounded,
                text: 'Home',
              ),
              GButton(
                icon: Icons.add_box_rounded,
                text: "Add prescription",
              ),
              GButton(
                icon: Icons.receipt_long,
                text: "Prescriptions",
              ),
            ]
          ),
        ),
      ),
    );
  }
}