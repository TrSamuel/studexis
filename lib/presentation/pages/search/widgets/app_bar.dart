import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

AppBar buildAppBarSearch(BuildContext context) {
  final studentNotifierData = Provider.of<StudentNotifier>(context);
  return AppBar(
    foregroundColor: secondaryColor,
    title: TextField(
      style: const TextStyle(color: secondaryColor),
      onChanged: (value) {
        studentNotifierData.seachStudents(searchValue: value);
      },
      cursorColor: reducedSecondaryColor,
      decoration: const InputDecoration(
        hintText: 'Search students...',
        hintStyle: TextStyle(color: reducedSecondaryColor),
        border: InputBorder.none,
      ),
    ),
    backgroundColor: primaryColor,
  );
}
