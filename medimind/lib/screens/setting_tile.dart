import 'package:flutter/material.dart';

// modular custom widget for a setting tile with a switch to toggle between true and false

class TrueFalseSettingTile extends StatelessWidget {
  const TrueFalseSettingTile(this.settingName, this.onConditionChange, this.defaultValue, {super.key});

  final String settingName;
  final Function onConditionChange;
  final bool defaultValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(settingName, style: const TextStyle(fontSize: 18),),
      Switch(
        value: defaultValue,
        onChanged: (value) {
          onConditionChange(value);
        },
      ),
    ],
    
    );
  }
}