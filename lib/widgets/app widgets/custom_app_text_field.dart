import 'package:flutter/material.dart';
import 'package:todo_app/widgets/widgets_export.dart';

class CustomTextField extends StatelessWidget {
  final String label; // Label for the TextField
  final TextEditingController? controller; // Optional controller
  final FocusNode? focusNode;
  final TextInputType keyboardType; // Input type (e.g., text, number)
  final bool obscureText; // For password fields, default is false
  final String hintText;

  const CustomTextField(
      {super.key,
      this.label = 'textField', // Default label if not provided
      this.controller,
      this.focusNode,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.hintText = 'label'});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.normal(color: Colors.grey),
        labelText: label,
        labelStyle: AppTextStyles.normal(fontSize: 12, color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey, // Border color when not focused
            width: 1.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue, // Border color when focused
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
