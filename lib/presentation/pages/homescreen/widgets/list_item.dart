import 'package:flutter/material.dart';
import 'package:studdataapp/data/model/student_model.dart';
import 'package:studdataapp/data/sources/db_function.dart';
import 'package:studdataapp/presentation/pages/viewscreen.dart/viewscreen.dart';
import 'package:studdataapp/core/constants/txtconst.dart';

class ListItem extends StatelessWidget {
  
  final StudentModel student;
  
  const ListItem({
    super.key, required this.student,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Viewscreen(
             studentModel: student,
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          minTileHeight: 70,
          leading: Container(
            width: 70,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(18),
              ),
              image: DecorationImage(
                image: MemoryImage(student.studentPhoto),
              ),
            ),
          ),
          horizontalTitleGap: 75,
          title: Text(
            student.studentName,
            style: itemTextStyle,
          ),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Delete"),
                  content: const Text("Do you want delete?'"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Dbfunctions.instance.deleteStudentData(studentId: student.studentId);
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, 'home-screen');
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
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
