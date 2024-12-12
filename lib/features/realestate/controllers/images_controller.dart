import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  RxString selectedPropertyImage = ''.obs;

  ///Get all images from the Product
  List<String> getPropertyImages(PropertyModel property) {
    Set<String> images = {};
    
    images.add(property.image!);

    // Assign Property Image as the Selected Image
    selectedPropertyImage.value = property.image!;

    if(property.propertyImages != null) {
      images.addAll(property.propertyImages!);
    }

    return images.toList();
  }


  void showEnlargeImage(String image){
      Get.to(
        fullscreenDialog: true,
          () => Dialog.fullscreen(
             child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: TSizes.defaultSpace * 2,
                          horizontal: TSizes.defaultSpace,),
                  child: CachedNetworkImage(imageUrl: image,),),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        child: const Text('Close'),
                      ),
                    ),
                  )
                ],
              ),
          ),
          );

  }
}