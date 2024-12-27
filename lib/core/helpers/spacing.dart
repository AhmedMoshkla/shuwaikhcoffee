// File: spacing.dart
import 'package:flutter/material.dart';

Widget verticalSpace(double height) => SizedBox(height: height);
Widget horizontalSpace(double width) => SizedBox(width: width);

// File: assets_path.dart
class Assets {
  static const String logo = 'assets/images/logo.png';
  static const String homeIcon = 'assets/icons/home.svg';
  static const String ticketIcon = 'assets/icons/ticket.svg';
}