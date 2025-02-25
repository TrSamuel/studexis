import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/data/model/student_model.dart';
import 'package:studdataapp/data/sources/db_function.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class DeleteStudentButton extends StatelessWidget {
  const DeleteStudentButton({
    super.key,
    required this.studentModel,
  });

  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    final studentNotifierData =
        Provider.of<StudentNotifier>(context, listen: false);
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Delete"),
            content: const Text("Do you want delete?'"),
            actions: [
              TextButton(
                onPressed: () {
                  Dbfunctions.instance.deleteStudentData(
                    studentId: studentModel.studentId,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: successColor,
                      content: Text("Deleted successfully"),
                    ),
                  );
                  studentNotifierData.getStudents();
                  Navigator.pop(context);
                  Navigator.maybePop(context);
                },
                child: const Text("Confirm"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        );
      },
      icon: const Icon(
        Icons.delete,
        color: primaryColor,
      ),
    );
  }
}
