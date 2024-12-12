import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/controllers/propertymanager.dart';
import 'package:realestateapi/model/vendor.dart';
import 'package:realestateapi/screen/property_managers/widgets/howto.dart';
import 'package:realestateapi/screen/property_managers/widgets/my_button.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
import 'package:http/http.dart' as http;
import 'package:realestateapi/model/state.dart';

class PropertyManagers extends StatefulWidget {
  const PropertyManagers({super.key});

  @override
  State<PropertyManagers> createState() => _PropertyManagersState();
}

class _PropertyManagersState extends State<PropertyManagers> {


  final rentController = TextEditingController();
  final commentController = TextEditingController();
  final _apartment = ["1 Bedroom", "2 Bedroom", "3 Bedroom", "4 Bedroom"];

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    getLocations();
    getVendors();
  }

  Future<List<StateModel>> getLocations() async {
    var url = 'https://shelterplug.com/api/states';
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    final data = json.decode(response.body);
    final results = data as List<dynamic>;
    final locations =
        results.map((e) => StateModel(id: e['id'], name: e['name'])).toList();
    return locations;
  }

  Future<List<Vendor>> getVendors() async {
    var url = 'https://shelterplug.com/api/vendors';
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    final data = json.decode(response.body);
    final results = data as List<dynamic>;
    final vendors =
        results.map((e) => Vendor(id: e['id'], name: e['name'])).toList();
    return vendors;
  }

  @override
  void dispose() {
    rentController.dispose();
    commentController.dispose();
    super.dispose();
  }

  PropertyManagerController propertyManagerController =
      Get.put(PropertyManagerController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TAppBar(
          title: Text('Property Management'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const PropertyMgtDetails(),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(
                  TSizes.defaultSpace,
                ),
                child: Column(children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please name is required';
                      }
                      return null;
                    },
                    controller: propertyManagerController.name,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: "Name",
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please email address is required';
                      }
                      return null;
                    },
                    controller: propertyManagerController.email,
                    decoration: const InputDecoration(
                        labelText: "Email Address",
                        prefixIcon: Icon(Iconsax.folder)),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please phone is required';
                      }
                      return null;
                    },
                    controller: propertyManagerController.phone,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.call),
                      labelText: "Phone",
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  FutureBuilder<List<Vendor>>(
                      future: getVendors(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButtonFormField(
                            value: propertyManagerController.vendor_id,
                            hint: const Text('Select Vendors'),
                            items: snapshot.data!
                                .map((e) => DropdownMenuItem(
                                    value: e.id, child: Text(e.name)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                propertyManagerController.vendor_id = value;
                                debugPrint(propertyManagerController.vendor_id.toString());
                              });
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.location,
                              ),
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  FutureBuilder<List<StateModel>>(
                      future: getLocations(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButtonFormField(
                            value: propertyManagerController.state_id,
                            hint: const Text('Select State'),
                            items: snapshot.data!
                                .map((e) => DropdownMenuItem(
                                    value: e.id, child: Text(e.name)))
                                .toList(),
                            onChanged: (value) {

                              setState(() {
                                propertyManagerController.state_id = value;
                                debugPrint(propertyManagerController.state_id.toString());
                              });
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.location,
                              ),
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  DropdownButtonFormField(
                    value: propertyManagerController.type_of_house,
                    items: _apartment
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        propertyManagerController.type_of_house = val;
                      });
                    },
                    icon: const Icon(Iconsax.arrow_down5),
                    decoration: const InputDecoration(
                        labelText: "Type of Apartment",
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'What is the Expected Rent?';
                      }
                      return null;
                    },
                    controller: propertyManagerController.expected_rent,
                    decoration: const InputDecoration(
                        labelText: 'Expected Rent',
                        prefixIcon: Icon(Iconsax.money)),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Some Comments';
                      }
                      return null;
                    },
                    controller: propertyManagerController.comments,
                    maxLines: 3,
                    decoration: const InputDecoration(
                        labelText: 'Comments',
                        prefixIcon: Icon(Iconsax.document)),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  MyBtn(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                       propertyManagerController.createPropertyManagement();
                      }
                    },
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
