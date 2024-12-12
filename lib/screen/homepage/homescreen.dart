import 'package:flutter/material.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TAppBar(
              showBackArrow: true,
              title: Text('Welcome'),
            )
          ],
        ),
      ),
    );
  }
}
