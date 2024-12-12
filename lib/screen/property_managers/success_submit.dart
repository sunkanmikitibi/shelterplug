import 'package:flutter/material.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class PropertyManagerSubmitSuccess extends StatelessWidget {
  const PropertyManagerSubmitSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Property Manager Form Submission Successful'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Flexible(child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/images/success.png'),
              ),),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const Text(
          'Property Management Application Successfully Submitted \n'
              'Please we will get back to you soon...Thanks',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
