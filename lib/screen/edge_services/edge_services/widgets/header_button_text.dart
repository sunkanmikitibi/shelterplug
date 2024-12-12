import 'package:flutter/material.dart';
import 'package:realestateapi/utils/constants/color.dart';

class THeaderButtonsText extends StatelessWidget {
  const THeaderButtonsText({
    super.key, required this.title,
  });
  
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          color: TColors.white.withOpacity(0.7)),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: TColors.black),
      ),
    );
  }
}