import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medimind/settingTile.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

void lightDarkModeChange(){
  print('Light/Dark Mode Changed');
}

class _settingsState extends State<settings> {
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