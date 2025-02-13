import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/data/sources/db_function.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(
        Icons.delete,
        color: primaryColor,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Accout Delete"),
            content: const Text(
                "After deleting your account, students data will also be deleted from the database. Do you want to delete your account permanently?"),
            actions: [
              TextButton(
                onPressed: () {
                  Dbfunctions.instance.removeAuth();
                  Dbfunctions.instance.deleteAll();
                  Navigator.pushReplacementNamed(context, 'register-screen');
                },
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No"),
              ),
            ],
          ),
        );
      },
      label: const Text("Account delete"),
      style: TextButton.styleFrom(foregroundColor: primaryColor),
    );
  }
}
