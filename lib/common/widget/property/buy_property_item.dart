import 'package:flutter/material.dart';

import '../../../model/property.dart';

class BuyPropertyGridItem extends StatelessWidget {
  const BuyPropertyGridItem({
    super.key,
    required this.buyProperties,
  });

  final Property buyProperties;

  @override
  Widget build(BuildContext context) {
    return Text(buyProperties.title);
  }
}