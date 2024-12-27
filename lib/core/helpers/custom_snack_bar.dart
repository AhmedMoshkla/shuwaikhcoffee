// File: custom_snack_bar.dart
import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String message, bool isError) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: isError ? Colors.red : Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
