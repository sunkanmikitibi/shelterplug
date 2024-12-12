import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/widget/circular_image.dart';
import 'package:realestateapi/common/widget/section_heading.dart';
import 'package:realestateapi/common/widget/shimmer.dart';
import 'package:realestateapi/utils/theme/custom_themes/image_strings.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../../common/widget/appbar/appbar.dart';
import '../../features/personalization/controllers/user_controller.dart';
import 'change_name.dart';
import 'widget/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage!.isNotEmpty
                          ? networkImage
                          : TImages.userProfilePix;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 85,
                            )
                          : TCircularImage(
                              image: image,
                              width: 120,
                              height: 120,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              //Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              TProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                icon: Iconsax.arrow_right_34,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              TProfileMenu(
                  title: 'Username',
                  value: controller.user.value.username,
                  icon: Iconsax.arrow_right_34,
                  onPressed: () {}),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenu(
                title: 'User Id',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Email',
                value: controller.user.value.email,
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phone,
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: 'Male',
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Date of Birth',
                value: '14 Apr, 1982',
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
