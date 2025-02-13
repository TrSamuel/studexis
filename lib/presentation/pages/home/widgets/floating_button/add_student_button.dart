import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/colorconst.dart';

class AddStudentButton extends StatelessWidget {
  const AddStudentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
      onPressed: () {
        Navigator.pushNamed(context, 'add-stud-data-screen');
      },
      child: const Icon(Icons.add),
    );
  }
}
