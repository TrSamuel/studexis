import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studdataapp/core/constants/txtconst.dart';
import 'package:studdataapp/data/model/student_model.dart';

class Dbfunctions {
  late SharedPreferences auth;

  late Box<StudentModel> studentBox;

  Dbfunctions.internal();

  static Dbfunctions instance = Dbfunctions.internal();

  factory Dbfunctions() {
    return instance;
  }

  Future<void> initDB() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
      Hive.registerAdapter(StudentModelAdapter());
    }
    await getSharedPreferencesObject();
    studentBox = await Hive.openBox<StudentModel>(studentBoxName);
  }

  Future<void> getSharedPreferencesObject() async {
    auth = await SharedPreferences.getInstance();
  }

  Future registerAuth(
      {required final String email, required final String password}) async {
    await auth.setString('email', email);
    await auth.setString('password', password);
    await auth.setBool('login-status', true);
  }

  Future removeAuth() async {
    await auth.setBool('login-status', false);
    await auth.remove('email');
    await auth.remove('password');
  }

  Future<bool> signInAuth({
    required final String email,
    required final String password,
  }) async {
    final String? authEmail = auth.getString('email');
    final String? authPassword = auth.getString('password');

    if (authEmail == email && authPassword == password) {
      await auth.setBool('login-status', true);
      return true;
    } else {
      return false;
    }
  }

  Future signOutAuth() async {
    await auth.setBool('login-status', false);
  }

  Future<void> addStudentData({required StudentModel studentModel}) async {
    await studentBox.put(studentModel.studentId, studentModel);
  }

  Future<void> editStudentData({required StudentModel studentModel}) async {
      await studentBox.put(studentModel.studentId, studentModel);
  }

  Future<List<StudentModel>> getStudentsData() async {
    return studentBox.values.toList();
  }

  Future deleteStudentData({required String studentId}) async {
    await studentBox.delete(studentId);
  }

  Future<void> deleteAll() async {
    await studentBox.deleteAll(studentBox.keys);
  }
}
