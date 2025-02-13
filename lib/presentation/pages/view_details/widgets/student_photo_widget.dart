import 'package:flutter/material.dart';
import 'package:studdataapp/data/model/student_model.dart';

class StudentPhotoWidget extends StatelessWidget {
  const StudentPhotoWidget({
    super.key,
    required this.studentModel,
  });

  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: MemoryImage(studentModel.studentPhoto),
          ),
        ),
      ),
    );
  }
}
