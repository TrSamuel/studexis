import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/core/constants/imgcost.dart';
import 'package:studdataapp/core/constants/txtconst.dart';
import 'package:studdataapp/data/sources/db_function.dart';
import 'package:studdataapp/presentation/pages/homescreen/widgets/grid_view_student.dart';
import 'package:studdataapp/presentation/pages/homescreen/widgets/list_view_student.dart';
import 'package:studdataapp/presentation/widgets/valuenotifiers.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final searchController =
      TextEditingController(text: searchValue.value.trim());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: secondaryColor,
        title: const Text(appName),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                searchDataPoPUpDisplay.value = true;
              },
              icon: const Icon(Icons.search)),
          ValueListenableBuilder(
            valueListenable: homeView,
            builder: (context, value, child) => IconButton(
              onPressed: () {
                homeView.value = !homeView.value;
              },
              icon: Icon(
                value ? Icons.list : Icons.grid_3x3,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: homeView,
            builder: (context, value, child) =>
                value ? const ListViewStudent() : const GridViewStudent(),
            // value ? const Text("hi") : const Text("hi"),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        onPressed: () {
          Navigator.pushNamed(context, 'add-stud-data-screen');
        },
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            DrawerHeader(child: logo),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  label: const Text("Sign out"),
                  onPressed: () {
                    Dbfunctions.instance.signOutAuth();
                    Navigator.pushReplacementNamed(context, 'login-screen');
                  },
                  icon: const Icon(
                    Icons.logout,
                  ),
                  style: TextButton.styleFrom(foregroundColor: primaryColor),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Accout Delete"),
                        content: const Text(
                            "After delete your account aalso delete student data from database Do you want to delete account permanately? "),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Dbfunctions.instance.removeAuth();
                              Dbfunctions.instance.deleteTable();
                              Navigator.pushReplacementNamed(
                                  context, 'register-screen');
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
