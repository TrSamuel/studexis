import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studdataapp/data/model/student_model.dart';
import 'package:studdataapp/data/sources/db_function.dart';

class StudentNotifier extends ChangeNotifier {
  List<StudentModel> studentDataList = [];

  List<StudentModel> searchedStudentList = [];

  late StudentModel selectedStudent;

  Uint8List? studentPhoto;

  int selectedClass = 0;

  final ImagePicker picker = ImagePicker();

  void getStudents() async {
    studentDataList = await Dbfunctions.instance.getStudentsData();
    searchedStudentList = List.from(studentDataList);
    notifyListeners();
  }

  void seachStudents({required String searchValue}) {
    searchedStudentList = studentDataList
        .where(
          (StudentModel student) => student.studentName
              .toLowerCase()
              .startsWith(searchValue.trim().toLowerCase()),
        )
        .toList();
    notifyListeners();
  }

  void selectClass({required int studentClass}) {
    selectedClass = studentClass;
    notifyListeners();
  }

  void clearSelectedClass() {
    selectedClass = 0;
    notifyListeners();
  }

  void selectPhoto({Uint8List? photo}) async {
    if (photo == null) {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        studentPhoto = await image.readAsBytes();
      }
    } else {
      studentPhoto = photo;
    }
    notifyListeners();
  }

  void resetStudentPhoto() {
    studentPhoto = null;
    notifyListeners();
  }

  void selectStudent({required StudentModel studentMOdel}) {
    selectedStudent = studentMOdel;
    notifyListeners();
  }
}
