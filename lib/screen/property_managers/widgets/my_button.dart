
import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  const MyBtn({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          "Submit".toUpperCase(),
        ),
      ),
    );
  }
}
