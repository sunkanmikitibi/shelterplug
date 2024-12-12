
import 'package:flutter/material.dart';

class TTextField extends StatelessWidget {
  const TTextField({
    super.key,
    required this.labelText,
    required this.icon,
    required this.controller,
  });

  final String labelText;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
