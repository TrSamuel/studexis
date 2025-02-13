
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessageSnackBar({required BuildContext context,required String message,required Color  color}) {
    return ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                            backgroundColor: color,
                            content: Text(message),
                          ),
                        );
  }