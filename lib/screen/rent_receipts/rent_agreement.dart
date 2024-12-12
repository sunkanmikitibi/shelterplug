import 'package:flutter/material.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/primary_header_container.dart';
import 'package:realestateapi/utils/constants/color.dart';

class RentAgreement extends StatelessWidget {
  const RentAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                showBackArrow: true,
                  title: Text(
                    'Rent Agreement',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(color: TColors.white),
                  ),
                ),
                const SizedBox(height: 300,),
              ],
            ),),
            const Text('Rent Agreement')
          ],
        ),
      ),
    );
  }
}
