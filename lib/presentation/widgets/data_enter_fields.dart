import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studdataapp/core/constants/colorconst.dart';

class DataEnterFields extends StatelessWidget {
  final String hintTextName;
  final String labelTextName;
  final int? maxLines;
  final TextInputType? textInputType;
  final TextEditingController textController;
  final bool isPassword;

  const DataEnterFields({
    super.key,
    required this.textController,
    required this.hintTextName,
    this.maxLines,
    this.textInputType,
    required this.labelTextName,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double fieldWidth;

    if (size.width > 900) {
      fieldWidth = size.width * 0.4;
    } else if (size.width > 600) {
      fieldWidth = size.width * 0.6;
    } else {
      fieldWidth = size.width * 0.9;
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: (size.width - fieldWidth) / 2,
      ),
      child: TextFormField(
        controller: textController,
        maxLines: !isPassword ? maxLines : 1,
        keyboardType: textInputType,
        obscureText: isPassword,
        inputFormatters: textInputType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        decoration: InputDecoration(
          hintText: hintTextName,
          labelText: labelTextName,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor)),
        ),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }
}
