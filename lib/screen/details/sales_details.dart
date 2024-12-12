import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:realestateapi/model/properties.dart';

class SalesDetails extends StatelessWidget {
  final Property property;
  const SalesDetails({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title),
      ),
      body: Column(
        children: [
          Card(
            elevation: 0,
            child: CachedNetworkImage(
              imageUrl: property.image,
              width: double.infinity,
            ),
          ),
          Text(property.title),
          Text(property.city),
          Text(property.description),
        ],
      ),
    );
  }
}
