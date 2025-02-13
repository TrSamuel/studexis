import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/data/model/student_model.dart';
import 'package:studdataapp/presentation/widgets/grid_item.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class GridviewSearch extends StatelessWidget {
  const GridviewSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Consumer<StudentNotifier>(
        builder: (context, studentNotifierData, _) {
          final List<StudentModel> studentsList =
              studentNotifierData.searchedStudentList;
          if (studentsList.isEmpty) {
            return const Center(child: Text("No data available"));
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: studentsList.length,
            itemBuilder: (context, index) {
              return GridItem(student: studentsList[index]);
            },
          );
        },
      ),
    );
  }
}
