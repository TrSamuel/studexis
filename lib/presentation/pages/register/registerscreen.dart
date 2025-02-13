import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/core/constants/txtconst.dart';
import 'package:studdataapp/data/sources/db_function.dart';
import 'package:studdataapp/presentation/widgets/data_enter_fields.dart';
import 'package:studdataapp/presentation/widgets/show_msg_snackbar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailCotroller = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(28),
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                appName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              DataEnterFields(
                labelTextName: 'Email',
                textController: emailCotroller,
                hintTextName: 'Email',
              ),
              DataEnterFields(
                labelTextName: 'Password',
                textController: passwordController,
                hintTextName: 'Password',
                isPassword: true,
              ),
              DataEnterFields(
                labelTextName: 'Confirm Password',
                textController: confirmPasswordController,
                hintTextName: 'Confirm Password',
                isPassword: true,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: secondaryColor,
                    fixedSize: const Size(500, 40)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    passwordController.text = passwordController.text.trim();
                    emailCotroller.text = emailCotroller.text.trim();
                    confirmPasswordController.text =
                        confirmPasswordController.text.trim();

                    final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                    final passwordRegex =
                        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])');

                    if (!emailRegex.hasMatch(emailCotroller.text)) {
                      showMessageSnackBar(
                          context: context,
                          message: "Invalid email",
                          color: errorColor);
                    } else if (!passwordRegex
                        .hasMatch(passwordController.text)) {
                       showMessageSnackBar(
                          context: context,
                          message: "Password Must include uppercase letters, lowercase letters and numbers",
                          color: errorColor);
                    } else if (passwordController.text.length < 8) {
                       showMessageSnackBar(
                          context: context,
                          message: "Password length must be atleast 8 characters",
                          color: errorColor);
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                       showMessageSnackBar(
                          context: context,
                          message:  "Password and Confirm password didn't match",
                          color: errorColor);
                    } else {
                      Dbfunctions.instance.registerAuth(
                        email: emailCotroller.text,
                        password: passwordController.text,
                      );
                      Navigator.pushReplacementNamed(context, 'home-screen');
                    }
                  }
                },
                child: const Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
