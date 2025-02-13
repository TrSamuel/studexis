import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/core/constants/txtconst.dart';
import 'package:studdataapp/presentation/pages/view_details/widgets/data_details.dart';
import 'package:studdataapp/presentation/pages/view_details/widgets/delete_student_button.dart';
import 'package:studdataapp/presentation/pages/view_details/widgets/edit_student_button.dart';
import 'package:studdataapp/presentation/pages/view_details/widgets/student_photo_widget.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class ViewDetailsScreen extends StatelessWidget {
  const ViewDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentNotifier>(
      builder: (context, studentNotifierData, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          foregroundColor: secondaryColor,
          title: Text(studentNotifierData.selectedStudent.studentName),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Card(
              child: Column(
                children: [
                  StudentPhotoWidget(
                      studentModel: studentNotifierData.selectedStudent),
                  const SizedBox(
                    height: 20,
                  ),
                  DataDetails(
                    fieldName: 'Name',
                    name: studentNotifierData.selectedStudent.studentName,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DataDetails(
                    fieldName: 'Class',
                    name: studentNotifierData.selectedStudent.studentClass
                        .toString(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DataDetails(
                    fieldName: 'Age',
                    name: studentNotifierData.selectedStudent.studentAge
                        .toString(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DataDetails(
                    fieldName: 'Address',
                    name: studentNotifierData.selectedStudent.studentAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EditStudentButton(
                          studentModel: studentNotifierData.selectedStudent,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        DeleteStudentButton(
                            studentModel: studentNotifierData.selectedStudent),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle viewStudDetailsTextStyle() => const TextStyle(fontSize: 24);
}
