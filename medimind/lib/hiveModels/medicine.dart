import 'package:hive/hive.dart';

part 'medicine.g.dart'; // links to the generated file

@HiveType(typeId: 0)
class Medicine extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String dosage;

  @HiveField(2)
  int frequency;

  @HiveField(3)
  DateTime timeOfDay;

  @HiveField(4)
  int courseLengthDays;

  Medicine({
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.timeOfDay,
    required this.courseLengthDays,
  });
}