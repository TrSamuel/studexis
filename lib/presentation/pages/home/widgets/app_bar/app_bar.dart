import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/core/constants/txtconst.dart';
import 'package:studdataapp/presentation/pages/search/search_screen.dart';

AppBar buildAppBarHome(BuildContext context) {
  return AppBar(
    foregroundColor: secondaryColor,
    title: const Text(appName),
    backgroundColor: primaryColor,
    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ));
        },
        icon: const Icon(Icons.search),
      ),
    ],
  );
}
