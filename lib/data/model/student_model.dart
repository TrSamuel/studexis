import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  String studentId;

  @HiveField(1)
  String studentName;

  @HiveField(2)
  Uint8List studentPhoto;

  @HiveField(3)
  int studentAge;

  @HiveField(4)
  String studentAddress;

  @HiveField(5)
  int studentClass;

  StudentModel({
    required this.studentId,
    required this.studentName,
    required this.studentPhoto,
    required this.studentAge,
    required this.studentAddress,
    required this.studentClass,
  });
}
