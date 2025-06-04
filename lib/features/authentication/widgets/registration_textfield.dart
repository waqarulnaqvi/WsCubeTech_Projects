import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? hintText;
  final String? Function(String?)? validator;
  const RegistrationTextField({required this.controller,super.key, required this.keyboardType, this.validator, this.hintText});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: validator,

      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
