import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/shimmer.dart';
import 'package:realestateapi/features/personalization/controllers/user_controller.dart';
import 'package:realestateapi/utils/constants/color.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: TSizes.md,),
          Obx(
            () {
              if(controller.profileLoading.value) {
                return const TShimmerEffect(width: 150, height: 15,);
              } else {return Text(
                'Welcome ${controller.user.value.fullName}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(color: TColors.grey),
              );}
              }
          ),
          Text(
            "Search Properties",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          )
        ],
      ),

    );
  }
}
