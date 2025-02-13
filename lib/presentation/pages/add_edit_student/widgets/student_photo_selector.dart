import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class StudentPhotoSelector extends StatelessWidget {
  const StudentPhotoSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentNotifier>(
      builder: (context, studentNotifierData, _) {
        return studentNotifierData.studentPhoto != null
            ? GestureDetector(
                onTap: () async {
                  studentNotifierData.selectPhoto();
                },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      foregroundImage:
                          MemoryImage(studentNotifierData.studentPhoto!),
                    ),
                    const Icon(
                      Icons.camera_alt,
                      color: primaryColor,
                    ),
                  ],
                ),
              )
            : IconButton(
                color: primaryColor,
                onPressed: () async {
                  studentNotifierData.selectPhoto();
                },
                icon: const Icon(Icons.camera_alt),
              );
      },
    );
  }
}
