import 'package:flutter/material.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Add Property'),
        showBackArrow: true,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0,),
          child: Form(
            child: Column(
              children: [
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
