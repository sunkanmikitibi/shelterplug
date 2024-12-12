import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.obscureText, required this.icon});
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: Icon(icon,),
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w200,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 15,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
        ),
      ),
    );
  }
}
