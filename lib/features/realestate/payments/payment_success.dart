import 'package:flutter/material.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key, required this.successMessage});
  final String successMessage;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Payment Successfult'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Payment Successfull'
            )
          ],
        ),
      ),
    );
  }
}
