import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/data/model/student_model.dart';
import 'package:studdataapp/presentation/pages/add_edit_student/add_edit_screen.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class EditStudentButton extends StatelessWidget {
  final StudentModel studentModel;
  const EditStudentButton({
    super.key,
    required this.studentModel,
  });

  @override
  Widget build(BuildContext context) {
    final studentNotifierData =
        Provider.of<StudentNotifier>(context, listen: false);
    return IconButton(
        onPressed: () {
          studentNotifierData.selectPhoto(photo: studentModel.studentPhoto);
          studentNotifierData.selectClass(
              studentClass: studentModel.studentClass);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditScreen(
                studentModel: studentModel,
              ),
            ),
          );
        },
        icon: const Icon(Icons.edit,color: primaryColor,));
  }
}
