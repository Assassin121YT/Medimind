import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medimind/setting_tile.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

void lightDarkModeChange(){
  print('Light/Dark Mode Changed');
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
        TrueFalseSettingTile('Light/DarkMode', lightDarkModeChange, false) // FIX: Pass the correct parameters
      ])
      );
  }
}