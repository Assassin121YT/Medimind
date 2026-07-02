import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medimind/setting_tile.dart';
import 'dart:developer' as developer;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

void lightDarkModeChange(){
  /* print that something happened. temporary code till actual 
    light/darkmode logic is implemented
  */
  developer.log('Light/Dark mode changed', name: 'Settings');
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Settings'),
      ),
      body: Column(children:[

        // custom widget for a setting tile
        TrueFalseSettingTile('Light/DarkMode', lightDarkModeChange, false) // FIX: Pass the correct parameters
      ])
      );
  }
}