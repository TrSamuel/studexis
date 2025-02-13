import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/data/sources/db_function.dart';
import 'package:studdataapp/presentation/pages/homescreen/homescreen.dart';
import 'package:studdataapp/presentation/pages/add_student/addstuddatascreen.dart';
import 'package:studdataapp/presentation/pages/loginscreen/loginscreen.dart';
import 'package:studdataapp/presentation/pages/registerscreen.dart/registerscreen.dart';
import 'package:studdataapp/presentation/pages/splashscreen/splashscreen.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Dbfunctions.instance.initDB();

  runApp(const StudDataApp());
}

class StudDataApp extends StatelessWidget {
  const StudDataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'splash-screen': (context) => const SplashScreen(),
          'home-screen': (context) => HomeScreen(),
          'login-screen': (context) => const Loginscreen(),
          'register-screen': (context) => const RegisterScreen(),
          'add-stud-data-screen': (context) => const AddStudDataScreen(),
        },
        initialRoute: 'splash-screen',
      ),
    );
  }
}
