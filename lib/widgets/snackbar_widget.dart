import 'package:flutter/material.dart';

customSnackbar(
  BuildContext context, {
  required String message,
  required bool status,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, textAlign: TextAlign.center),
      backgroundColor: status == true ? Colors.green : Colors.red,
    ),
  );
}
