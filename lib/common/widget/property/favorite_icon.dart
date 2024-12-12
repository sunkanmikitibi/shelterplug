
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../icons/t_circular_icon.dart';

class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TCircularIcon(
      onPressed: () {
        debugPrint('clicked');
      },
      icon: Iconsax.heart5,
      color: Colors.red,
    );
  }
}