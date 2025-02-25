import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdataapp/core/constants/colorconst.dart';
import 'package:studdataapp/data/model/student_model.dart';
import 'package:studdataapp/data/sources/db_function.dart';
import 'package:studdataapp/presentation/pages/add_edit_student/widgets/student_class_selector.dart';
import 'package:studdataapp/presentation/pages/add_edit_student/widgets/student_photo_selector.dart';
import 'package:studdataapp/presentation/widgets/data_enter_fields.dart';
import 'package:studdataapp/presentation/widgets/show_msg_snackbar.dart';
import 'package:studdataapp/state/providers/student_provider.dart';

class AddEditScreen extends StatefulWidget {
  final StudentModel? studentModel;
  const AddEditScreen({
    super.key,
    this.studentModel,
  });

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void initState() {
    if (widget.studentModel != null) {
      nameController.text = widget.studentModel!.studentName;
      ageController.text = widget.studentModel!.studentAge.toString();
      addressController.text = widget.studentModel!.studentAddress;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final studentNotifierData =
        Provider.of<StudentNotifier>(context, listen: false);
    const height15 = SizedBox(
      height: 15,
    );
    final Size size=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: secondaryColor,
        title:
            Text(widget.studentModel == null ? 'Add student' : 'Edit student'),
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {
              studentNotifierData.resetStudentPhoto();
              studentNotifierData.clearSelectedClass();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
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
                  const StudentPhotoSelector(),
                  height15,
                  DataEnterFields(
                    labelTextName: 'Name',
                    hintTextName: 'Name',
                    textController: nameController,
                    textInputType: TextInputType.name,
                  ),
                  height15,
                  DataEnterFields(
                    labelTextName: 'Age',
                    textInputType: TextInputType.number,
                    hintTextName: 'Age',
                    textController: ageController,
                  ),
                  height15,
                  DataEnterFields(
                    labelTextName: 'Address',
                    hintTextName: 'Address',
                    textInputType: TextInputType.multiline,
                    textController: addressController,
                    maxLines: 3,
                  ),
                  height15,
                  StudentClassSelector(size: size,),
                  const SizedBox(
                    height: 75,
                  ),
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
                    child:
                        Text(widget.studentModel == null ? "Save" : "Update"),
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
      if (studentNotifierData.studentPhoto == null) {
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
          studentId: widget.studentModel == null
              ? DateTime.now().millisecondsSinceEpoch.toString()
              : widget.studentModel!.studentId,
          studentName: nameController.text,
          studentPhoto: studentNotifierData.studentPhoto!,
          studentAge: int.parse(ageController.text),
          studentAddress: addressController.text,
          studentClass: studentNotifierData.selectedClass,
        );
        await Dbfunctions.instance.addStudentData(studentModel: studentModel);
        studentNotifierData.selectStudent(studentMOdel: studentModel);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: successColor,
            content: Text(widget.studentModel == null
                ? "Data saved successfully"
                : "Data updated successfully"),
          ),
        );
        nameController.clear();
        ageController.clear();
        addressController.clear();
        studentNotifierData.clearSelectedClass();
        studentNotifierData.getStudents();
        studentNotifierData.resetStudentPhoto();
        Navigator.pop(context);
      }
    }
  }
}
