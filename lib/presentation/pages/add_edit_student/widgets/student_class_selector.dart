import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class StudentClassSelector extends StatelessWidget {
  final Size size;
  const StudentClassSelector({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    double dropdownWidth;

    if (size.width > 900) {
      dropdownWidth = size.width * 0.37;
    } else if (size.width > 600) {
      dropdownWidth = size.width * 0.57;
    } else {
      dropdownWidth = size.width * 0.87;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: (size.width - dropdownWidth) / 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Class",
            style: TextStyle(color: Color.fromARGB(184, 0, 0, 0)),
          ),
          Consumer<StudentNotifier>(
            builder: (context, studentNotifierData, _) => SizedBox(
              width: dropdownWidth,
              child: DropdownButton<int>(
                dropdownColor: secondaryColor,
                iconEnabledColor: primaryColor,
                isExpanded: true,
                value: studentNotifierData.selectedClass,
                items: [
                  const DropdownMenuItem(
                    value: 0,
                    child: Text("Select class"),
                  ),
                  ...List.generate(
                    10,
                    (index) => DropdownMenuItem(
                      value: index + 1,
                      child: Text("${index + 1}"),
                    ),
                  )
                ],
                onChanged: (newSelectedClass) {
                  studentNotifierData.selectClass(
                      studentClass: newSelectedClass!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
