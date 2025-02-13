import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/colorconst.dart';

class DataDetails extends StatelessWidget {
  final String fieldName;
  final String name;
  const DataDetails({
    super.key,
    required this.fieldName,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: 80,
            child: Text(
              fieldName,
              style: const TextStyle(
                color: blueGray,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          Container(
            alignment: Alignment.topLeft,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: primaryColor,
                  width: 1,
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
