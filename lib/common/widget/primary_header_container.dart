
import 'package:flutter/material.dart';
import 'package:realestateapi/common/widget/circular_container.dart';
import 'package:realestateapi/common/widget/curved_edges_widget.dart';
import 'package:realestateapi/utils/constants/color.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });
  
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        width: double.infinity,
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                  top: -150,
                  right: -250,
                  child: TCircularContainer(
                    backgroundColor: TColors.textWhite.withOpacity(0.2),
                  )),
              Positioned(
                  top: 100,
                  right: -300,
                  child: TCircularContainer(
                    backgroundColor: TColors.textWhite.withOpacity(0.2),
                  )),

                  child,
            ],
          ),
        ),
      ),
    );
  }
}
