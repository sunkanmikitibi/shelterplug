
import 'package:flutter/material.dart';

class NewHouseAds extends StatelessWidget {
  const NewHouseAds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/house10.jpg'),
          ),
          Positioned(
            bottom: 25,
            right: 20,
            child: Text(
              'Property of the Month',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
              top: 15,
              left: 10,
              child: Text(
                '5 Bedroom Terrace Duplex',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
