import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/core/constants/txtconst.dart';
import 'package:studdataapp/data/sources/db_function.dart';
import 'package:studdataapp/presentation/widgets/data_enter_fields.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailCotroller = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: secondaryColor,
                      fixedSize: const Size(500, 40)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if (!emailRegex.hasMatch(emailCotroller.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: errorColor,
                            content: Text("Invalid email"),
                          ),
                        );
                      } else {
                        await Dbfunctions.instance
                            .signInAuth(
                          email: emailCotroller.text,
                          password: passwordController.text,
                        )
                            .then(
                          (value) {
                            value == true
                                ? Navigator.pushReplacementNamed(
                                    // ignore: use_build_context_synchronously
                                    context, 'home-screen')
                                // ignore: use_build_context_synchronously
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Entered email and password are incorrect",
                                      ),
                                    ),
                                  );
                          },
                        );
                      }
                    }
                  },
                  child: const Text("Sign In")),
            ],
          ),
        ),
      ),
    );
  }
}
