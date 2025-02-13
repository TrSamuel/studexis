import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/core/constants/txtconst.dart';
import 'package:studdataapp/data/model/student_model.dart';
import 'package:studdataapp/data/sources/db_function.dart';
import 'package:studdataapp/function/selectimg.dart';
import 'package:studdataapp/presentation/pages/add_student/widgets/student_class_selector.dart';
import 'package:studdataapp/presentation/widgets/data_enter_fields.dart';
import 'package:studdataapp/presentation/widgets/show_msg_snackbar.dart';
import 'package:studdataapp/presentation/widgets/valuenotifiers.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class AddStudDataScreen extends StatefulWidget {
  const AddStudDataScreen({
    super.key,
  });

  @override
  State<AddStudDataScreen> createState() => _AddStudDataScreenState();
}

class _AddStudDataScreenState extends State<AddStudDataScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: secondaryColor,
        title: const Text('Add student'),
        backgroundColor: primaryColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  ValueListenableBuilder(
                    valueListenable: imgPreview,
                    builder: (context, value, child) {
                      return value != null
                          ? GestureDetector(
                              onTap: () async {
                                await selectImage();
                              },
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 45,
                                    foregroundImage: MemoryImage(value),
                                  ),
                                  const Icon(
                                    Icons.camera_alt,
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                            )
                          : IconButton(
                              color: primaryColor,
                              onPressed: () async {
                                await selectImage();
                              },
                              icon: const Icon(Icons.camera_alt),
                            );
                    },
                  ),
                  DataEnterFields(
                    hintTextName: 'Name',
                    textController: nameController,
                    textInputType: TextInputType.name,
                  ),
                  DataEnterFields(
                    textInputType: TextInputType.number,
                    hintTextName: 'Age',
                    textController: ageController,
                  ),
                  DataEnterFields(
                    hintTextName: 'Address',
                    textInputType: TextInputType.multiline,
                    textController: addressController,
                    maxLines: 3,
                  ),
                  const StudentClassSelector(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: secondaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 18),
                    ),
                    onPressed: () async {
                      validateData();
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateData() async {
    final studentNotifierData =
        Provider.of<StudentNotifier>(context, listen: false);
    if (formKey.currentState!.validate()) {
      if (imgPreview.value == null) {
        showMessageSnackBar(
            context: context,
            color: errorColor,
            message: "Photo should be required");
      } else if (studentNotifierData.selectedClass == 0) {
        showMessageSnackBar(
            context: context,
            color: errorColor,
            message: "Please select student class");
      } else {
        final StudentModel studentModel = StudentModel(
          studentId: DateTime.now().millisecondsSinceEpoch.toString(),
          studentName: nameController.text,
          studentPhoto: imgPreview.value!,
          studentAge: int.parse(ageController.text),
          studentAddress: addressController.text,
          studentClass: studentNotifierData.selectedClass,
        );
        await Dbfunctions.instance.addStudentData(studentModel: studentModel);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: successColor,
            content: Text("Data added successfully"),
          ),
        );
        nameController.clear();
        ageController.clear();
        addressController.clear();
        studentNotifierData.clearSelectedClass();
        studentNotifierData.getStudents();
        imgPreview.value = null;
        Navigator.pop(context);
      }
    }
  }
}
