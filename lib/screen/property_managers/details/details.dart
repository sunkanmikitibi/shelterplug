import 'package:flutter/material.dart';
import 'package:realestateapi/model/propertymanager.dart';

class PropertyMgtDetailsScreen extends StatelessWidget {
   const PropertyMgtDetailsScreen({
    super.key,
    required this.propertyManagerDetails, 
  });

 final PropertyManagerDetails propertyManagerDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
            
          ListTile(
            title: Text(propertyManagerDetails.name),
            subtitle: Text(propertyManagerDetails.email),
          ),
 
          ListTile(
            title: Text(propertyManagerDetails.phone),
          ),


          ListTile(
            title: Text(propertyManagerDetails.state.toString()),
          ),

        ],
      ),
    );
  }
}
