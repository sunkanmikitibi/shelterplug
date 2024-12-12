import 'package:flutter/material.dart';

import '../../model/properties.dart';

class ShortletScreen extends StatefulWidget {
  const ShortletScreen({super.key});

  @override
  State<ShortletScreen> createState() => _ShortletScreenState();
}

class _ShortletScreenState extends State<ShortletScreen> {
  List<Property>? shortlets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Text(
        shortlets?[index].title ?? '',
      ),
    );
  }
}
