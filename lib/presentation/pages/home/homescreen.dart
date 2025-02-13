import 'package:flutter/material.dart';
import 'package:studdataapp/presentation/pages/home/widgets/app_bar/app_bar.dart';
import 'package:studdataapp/presentation/pages/home/widgets/floating_button/add_student_button.dart';
import 'package:studdataapp/presentation/pages/home/widgets/grid_view/grid_view_student.dart';
import 'package:studdataapp/presentation/pages/home/widgets/open_drawer/open_drawer.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarHome(context),
      body: const GridViewHome(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const AddStudentButton(),
      drawer: const OpenDrawer(),
    );
  }
}
