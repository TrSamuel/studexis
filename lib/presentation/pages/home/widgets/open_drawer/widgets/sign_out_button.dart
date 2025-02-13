import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/data/sources/db_function.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: const Text("Sign out"),
      onPressed: () {
        Dbfunctions.instance.signOutAuth();
        Navigator.pushReplacementNamed(context, 'login-screen');
      },
      icon: const Icon(
        Icons.logout,
        color: primaryColor,
      ),
      style: TextButton.styleFrom(foregroundColor: primaryColor),
    );
  }
}
