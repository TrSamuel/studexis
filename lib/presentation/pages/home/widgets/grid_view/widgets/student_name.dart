import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/txtconst.dart';
import 'package:studdataapp/data/model/student_model.dart';

class StudentName extends StatelessWidget {
  const StudentName({
    super.key,
    required this.student,
  });

  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Text(
      student.studentName,
      style: itemTextStyle,
    );
  }
}
