import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/controllers/favorite_controller.dart';

import 't_circular_icon.dart';

class TFavoriteIcon extends StatelessWidget {
  TFavoriteIcon({super.key, required this.id});

  final controller = Get.put(FavoriteController());

  final String id;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        TCircularIcon(
          width: 40,
        height: 40,
        icon: controller.isFavorite(id)
            ? Icons.favorite
            : Icons.favorite_border,
        color: controller.isFavorite(id) ? Colors.red : Colors.grey,
        onPressed: ()  => controller.toggleFavoriteProperty(id),
      ),
    );
  }
}
