
import 'package:flutter/material.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';

class TLoginDivider extends StatelessWidget {
  const TLoginDivider({
    super.key, required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: dark ? Colors.white : Colors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),
        Text(
         dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
            child: Divider(
          color: dark ? Colors.white : Colors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        )),
      ],
    );
  }
}