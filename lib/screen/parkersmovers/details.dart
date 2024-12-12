import 'package:flutter/material.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/model/mover.dart';

// ignore: must_be_immutable
class ParkerMoversDetails extends StatelessWidget {
  ParkerMoversDetails({super.key, required this.moverDetails});

  MoverDetails moverDetails;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Parkers and Movers'),
        showBackArrow: true,
      ),
      body: Column(
        children: [
         Text('Successful')
        ],
      ),
    );
  }
}
