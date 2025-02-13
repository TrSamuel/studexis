import 'package:flutter/material.dart';
import 'package:studdataapp/data/model/student_model.dart';
import 'package:studdataapp/data/sources/db_function.dart';

class StudentNotifier extends ChangeNotifier {
  List<StudentModel> studentDataList = [];

  int selectedClass = 0;

  void getStudents() async {
    studentDataList = await Dbfunctions.instance.getStudentsData();
    studentDataList = studentDataList + studentDataList + studentDataList;
    notifyListeners();
  }

  void clearSelectedClass() {
    selectedClass = 0;
    notifyListeners();
  }

  void selectClass({required int studentClass}) {
    selectedClass = studentClass;
    notifyListeners();
  }
}
