import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/controllers/homeinterior.dart';
import 'package:realestateapi/model/location.dart';
import 'package:realestateapi/model/vendor.dart';
import 'package:realestateapi/screen/edge_services/edge_services/widgets/header_button_text.dart';
import 'package:http/http.dart' as http;
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class HomeInterior extends StatefulWidget {
  const HomeInterior({super.key});

  @override
  State<HomeInterior> createState() => _HomeInteriorState();
}

class _HomeInteriorState extends State<HomeInterior> {
  final _apartment = ["1 Bedroom", "2 Bedroom", "3 Bedroom", "4 Bedroom"];

  final _scopeOfWork = [
    "Full Home Interior",
    "Kitchen and Wardrobes",
    "Only Kitchen",
    "Others"
  ];

  final _timeline = [
    "0-3 months",
    "3-6 months",
    "more than 6 months",
    "Already Moved in"
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getLocations();
    getVendors();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<Location>> getLocations() async {
    var url = 'https://shelterplug.com/api/locations';
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    final data = json.decode(response.body);
    final results = data as List<dynamic>;
    final locations = results
        .map((e) => Location(id: e['id'], locationname: e['locationname']))
        .toList();
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

  HomeInteriorController homeInteriorController =
      Get.put(HomeInteriorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const TAppBar(
            title: Text('Home Interiors'),
            showBackArrow: true,
          ),
          Stack(children: [
            Image.asset('assets/images/home_interior.jpg'),
            Positioned(
              top: 100,
              left: 50,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 700,
                              padding: const EdgeInsets.all(
                                TSizes.defaultSpace,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      "How it Works",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  const Text("Its Simpler than you think!"),
                                  const SizedBox(
                                    height: TSizes.defaultSpace,
                                  ),
                                  Expanded(
                                    child: ListView(
                                      children: const [
                                        ListTile(
                                          title: Text('Submit your detail'),
                                        ),
                                        ListTile(
                                          title: Text(
                                              'Choose your favorite vendor & seal the deal'),
                                        ),
                                        ListTile(
                                          title: Text(
                                              "Place your order to begin the installations"),
                                        ),
                                        ListTile(
                                          title: Text(
                                              "Move in to home of your dreams"),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: const THeaderButtonsText(
                      title: 'How it Works',
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const THeaderButtonsText(title: 'FAQ'),
                  ),
                ],
              ),
            ),
          ]),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TextFormField(
                    controller: homeInteriorController.namecontroller,
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return 'Please Enter your Full name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user), labelText: 'Full Name'),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: homeInteriorController.emailcontroller,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Email is Required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: 'Email Address',
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: homeInteriorController.phoneController,
                    validator: (phone) {
                      if (phone == null || phone.isEmpty) {
                        return 'Phone number is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number',
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  FutureBuilder<List<Location>>(
                      future: getLocations(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButtonFormField(
                            validator: (location) {
                              if (location == null) {
                                return "Please Select a location";
                              }
                              return null;
                            },
                            value: homeInteriorController.selectedlocation,
                            hint: const Text('Select Location'),
                            items: snapshot.data!
                                .map((e) => DropdownMenuItem(
                                    value: e.id, child: Text(e.locationname)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                homeInteriorController.selectedlocation =
                                    value!;
                                debugPrint(homeInteriorController
                                    .selectedlocation
                                    .toString());
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Location',
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
                  TextFormField(
                    validator: (city) {
                      if (city == null || city.isEmpty) {
                        return 'Please City is required';
                      }
                      return null;
                    },
                    controller: homeInteriorController.citycontroller,
                    decoration: const InputDecoration(
                        labelText: 'City',
                        prefixIcon: Icon(Iconsax.map_1),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  DropdownButtonFormField(
                    value: homeInteriorController.selectedscope,
                    validator: (scope) {
                      if (scope == null || scope.isEmpty) {
                        return "Scope of work is required";
                      }
                      return null;
                    },
                    items: _scopeOfWork
                        .map((work) =>
                            DropdownMenuItem(value: work, child: Text(work)))
                        .toList(),
                    onChanged: (workScope) {
                      setState(() {
                        homeInteriorController.selectedscope = workScope;
                      });
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.work),
                      labelText: 'Scope of Work',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  FutureBuilder<List<Vendor>>(
                      future: getVendors(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButtonFormField(
                            isExpanded: true,
                            validator: (vendor) {
                              if (vendor == null) {
                                return "Please Select Vendor";
                              }
                              return null;
                            },
                            value: homeInteriorController.selectedvendor,
                            hint: const Text('Select Vendor'),
                            items: snapshot.data!
                                .map((e) => DropdownMenuItem(
                                    value: e.id, child: Text(e.name)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                homeInteriorController.selectedvendor = value!;
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Let us know your Budget';
                      }
                      return null;
                    },
                    controller: homeInteriorController.budgetcontroller,
                    decoration: const InputDecoration(
                        labelText: 'Budget',
                        prefixIcon: Icon(Iconsax.money),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  DropdownButtonFormField(
                    value: homeInteriorController.apartment,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Select Apartment';
                      }
                      return null;
                    },
                    items: _apartment
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        homeInteriorController.apartment = val;
                        debugPrint(homeInteriorController.apartment);
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Type of Apartment',
                      prefixIcon: Icon(Icons.bed),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  DropdownButtonFormField(
                    value: homeInteriorController.timeline,
                    validator: (timeline) {
                      if (timeline == null) {
                        return "Possession Timeline is required";
                      }
                      return null;
                    },
                    items: _timeline
                        .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                        .toList(),
                    onChanged: (timelineValue) => setState(() {
                      homeInteriorController.timeline = timelineValue;
                    }),
                    decoration:
                        const InputDecoration(labelText: 'Possession Timeline'),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: homeInteriorController.commentscontroller,
                    validator: (comment) {
                      if (comment == null) {
                        return "Please Enter comments";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Comments',
                        prefixIcon: Icon(Iconsax.message),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            homeInteriorController.createInteriorApplication();
                          }
                        },
                        child: const Text("Submit")),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
