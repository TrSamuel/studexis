import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/core/constants/imgcost.dart';
import 'package:studdataapp/data/sources/db_function.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        final auth = Dbfunctions.instance.auth;
        if (auth.getBool('login-status') == true) {
          moveHomeScreen();
        } else if (auth.getString('email') == null) {
          moveRegisterScreen();
        } else {
          moveLoginScreen();
        }
      },
    );

    super.initState();
  }

  void moveHomeScreen() {
    Provider.of<StudentNotifier>(context,listen: false).getStudents();
    Navigator.pushReplacementNamed(context, "home-screen");
  }

  void moveLoginScreen() {
    Navigator.pushReplacementNamed(context, 'login-screen');
  }

  void moveRegisterScreen() {
    Navigator.pushReplacementNamed(context, 'register-screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            logo,
            const SizedBox(
              height: 45,
            ),
            const CircularProgressIndicator(
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
