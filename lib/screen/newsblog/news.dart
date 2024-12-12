import 'package:flutter/material.dart';
import 'package:realestateapi/navigation_menu.dart';

class NewsUpdates extends StatefulWidget {
  const NewsUpdates({super.key});

  @override
  State<NewsUpdates> createState() => _NewsUpdatesState();
}

class _NewsUpdatesState extends State<NewsUpdates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigationMenu(),
      appBar: AppBar(
        title: const Text("Shelter Plug Blogs"),
      ),
    );
  }
}