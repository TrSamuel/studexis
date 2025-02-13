import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/core/constants/txtconst.dart';
import 'package:studdataapp/data/model/student_model.dart';
import 'package:studdataapp/data/sources/db_function.dart';

class Viewscreen extends StatelessWidget {
  final StudentModel studentModel;
  const Viewscreen({
    super.key, required this.studentModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        title: Text(appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Card(
          child: Column(
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: MemoryImage(studentModel.studentPhoto),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DataDetails(
                fieldName: 'Name',
                name: studentModel.studentName,
              ),
              DataDetails(
                fieldName: 'Class',
                name: studentModel.studentClass.toString(),
              ),
              DataDetails(
                fieldName: 'Age',
                name: studentModel.studentAge.toString(),
              ),
              DataDetails(
                fieldName: 'Address',
                name: studentModel.studentAddress,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Delete"),
                        content: const Text("Do you want delete?'"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Dbfunctions.instance.deleteStudentData(studentId: studentModel.studentId);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                  context, 'home-screen');
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
            ],
          ),
        ),
      ),
    );
  }

  TextStyle viewStudDetailsTextStyle() => const TextStyle(fontSize: 24);
}

class DataDetails extends StatelessWidget {
  final String fieldName;
  final String name;
  const DataDetails({
    super.key,
    required this.fieldName,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: 80,
            child: Text(
              fieldName,
              style: const TextStyle(
                color: blueGray,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Text(
            ":",
            style: TextStyle(
              color: blueGray,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          Container(
            alignment: Alignment.topLeft,
            width: 150,
            child: Text(
              name,
              style: const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
