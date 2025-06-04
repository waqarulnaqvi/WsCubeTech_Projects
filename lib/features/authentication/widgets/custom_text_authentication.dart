import 'package:flutter/material.dart';

class CustomTextAuthentication extends StatelessWidget {
  final String title;
  const CustomTextAuthentication({required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade800),
    );
  }
}
