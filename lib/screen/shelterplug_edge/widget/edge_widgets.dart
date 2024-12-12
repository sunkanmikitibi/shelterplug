 
import 'package:flutter/material.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/utils/constants/color.dart';

class EdgeService extends StatelessWidget {
  const EdgeService({
    super.key, this.imageUrl, this.title, this.onTapped,
  });

  final String? imageUrl;
  final String? title;
  final VoidCallback? onTapped;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: 100,
        height: 100,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: dark ? Colors.grey.shade500: TColors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset(            
            imageUrl!,
            fit: BoxFit.cover,
            width: 40,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
           title!,
           textAlign: TextAlign.center,
           maxLines: 2,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ]),
      ),
    );
  }
}
