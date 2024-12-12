import 'package:flutter/material.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/primary_header_container.dart';

class PgCoLivingScreen extends StatelessWidget {
  const PgCoLivingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: SingleChildScrollView(
       child: Column(
         children: [
           TPrimaryHeaderContainer(child: Column(
             children: [
               TAppBar(
                 showBackArrow: true,
                 title: Text('PG/Co-Living'),
               ),
                SizedBox(height: 300,)
             ],
           )),
           Text('PG/Co-living Properties')

         ],
       ),
     ),
    );
  }
}
