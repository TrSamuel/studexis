import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/colorconst.dart';

class DataEnterFields extends StatelessWidget {
  final String hintTextName;
  final int? maxLines;
  final TextInputType? textInputType;
    final TextEditingController textController;

  const DataEnterFields({
    super.key,
    required this.textController,
    required this.hintTextName,
    this.maxLines,
    this.textInputType,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: textController,
        maxLines: maxLines,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintTextName,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor)),
        ),
        validator: (value) {
          if (value!.isEmpty || value.trim() == '') {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }
}
