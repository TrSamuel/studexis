import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/presentation/pages/homescreen/widgets/list_item.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class ListViewStudent extends StatelessWidget {
  const ListViewStudent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentNotifier>(
        builder: (context, studentNotifierData, _) {
      if (studentNotifierData.studentDataList.isEmpty) {
        return const Text("No data available");
      }
      final students = studentNotifierData.studentDataList;
      return ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListItem(student: student,);
        },
      );
    });
  }
}
