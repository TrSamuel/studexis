import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class StudentClassSelector extends StatelessWidget {
  const StudentClassSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentNotifier>(
      builder: (context, studentNotifierData, _) => DropdownButton<int>(
        dropdownColor: secondaryColor,
        iconEnabledColor: primaryColor,
        isExpanded: true,
        menuWidth: 200,
        value: studentNotifierData.selectedClass,
        items:[
          const DropdownMenuItem(
            value: 0,
            child: Text(
              "Select class",
            ),
          ),
           ...List.generate(
          10,
          (index) => DropdownMenuItem(
            value: index + 1,
            child: Text(
              "${index + 1}",
            ),
          ),
        )
        ],
        onChanged: (newSelectedClass) {
          studentNotifierData.selectClass(studentClass: newSelectedClass!);
        },
      ),
    );
  }
}
