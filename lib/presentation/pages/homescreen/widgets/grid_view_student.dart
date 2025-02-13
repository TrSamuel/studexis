import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/core/constants/txtconst.dart';
import 'package:studdataapp/data/model/student_model.dart';
import 'package:studdataapp/presentation/pages/viewscreen.dart/viewscreen.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class GridViewStudent extends StatelessWidget {
  const GridViewStudent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Consumer<StudentNotifier>(
        builder: (context, studentNotifierData, _) {
          final List<StudentModel> studentsList =
              studentNotifierData.studentDataList;
          if (studentsList.isEmpty) {
            return const Text("No data available");
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 15, mainAxisSpacing: 15, crossAxisCount: 7),
            itemCount: studentsList.length,
            itemBuilder: (context, index) {
              final StudentModel student = studentsList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Viewscreen(
                          studentModel: student,
                        ),
                      ));
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          image: DecorationImage(
                            image: MemoryImage(student.studentPhoto),
                          ),
                        ),
                      ),
                      Text(
                        student.studentName,
                        style: itemTextStyle,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
