import 'package:flutter/material.dart';
import 'package:studdataapp/data/model/student_model.dart';

class StudentPhoto extends StatelessWidget {
  const StudentPhoto({
    super.key,
    required this.student,
  });

  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: MemoryImage(student.studentPhoto),
        ),
      ),
    );
  }
}
