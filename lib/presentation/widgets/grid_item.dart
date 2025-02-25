import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/data/model/student_model.dart';
import 'package:studdataapp/presentation/pages/home/widgets/grid_view/widgets/student_name.dart';
import 'package:studdataapp/presentation/pages/home/widgets/grid_view/widgets/student_photo.dart';
import 'package:studdataapp/presentation/pages/view_details/viewscreen.dart';
import 'package:studdataapp/presentation/pages/view_details/widgets/delete_student_button.dart';
import 'package:studdataapp/presentation/pages/view_details/widgets/edit_student_button.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class GridItem extends StatelessWidget {
  final StudentModel student;
  const GridItem({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final studentNotifierData =
        Provider.of<StudentNotifier>(context, listen: false);
    return InkWell(
      onTap: () {
        studentNotifierData.selectStudent(studentMOdel: student);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ViewDetailsScreen(),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            StudentPhoto(student: student),
            StudentName(student: student),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EditStudentButton(studentModel: student),
                DeleteStudentButton(studentModel: student)
              ],
            )
          ],
        ),
      ),
    );
  }
}
