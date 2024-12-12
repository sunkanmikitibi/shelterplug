import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/primary_header_container.dart';
import 'package:realestateapi/controllers/movers.dart';
import 'package:realestateapi/model/location.dart';
import 'package:realestateapi/model/mover.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
import 'package:http/http.dart' as http;

class ParkersMoverScreen extends StatefulWidget {
  const ParkersMoverScreen({super.key});

  @override
  State<ParkersMoverScreen> createState() => _ParkersMoverScreenState();
}

class _ParkersMoverScreenState extends State<ParkersMoverScreen> {
  final dateOfMovement = TextEditingController();
  final commentController = TextEditingController();

  @override
  void initState() {
    dateOfMovement.text = "";
    getLocationFrom();
    getLocationTo();
    super.initState();
  }

  MoverDetails moverDetails = MoverDetails();

  Future<List<Location>> getLocationTo() async {
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

  Future<List<Location>> getLocationFrom() async {
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

  final _parkerKey = GlobalKey<FormState>();

  MoverController moverController = Get.put(MoverController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  showBackArrow: true,
                  title: Text(
                    'Parkers and Movers',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(color: Colors.white),
                  ),
                ),
                const Image(image: AssetImage("assets/images/house1.png")),
              ],
            )),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Form(
                      key: _parkerKey,
                      child: Column(
                        children: [
                          FutureBuilder<List<Location>>(
                              future: getLocationTo(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return DropdownButtonFormField(
                                    value: moverController.locationFrom,
                                    hint: const Text('Select Relocation From'),
                                    items: snapshot.data!
                                        .map((e) => DropdownMenuItem(
                                            value: e.id,
                                            child: Text(e.locationname)))
                                        .toList(),
                                    onChanged: (valuefrom) {
                                      setState(() {
                                        moverController.locationFrom =
                                            valuefrom!;
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
                          FutureBuilder<List<Location>>(
                              future: getLocationFrom(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return DropdownButtonFormField(
                                    value: moverController.locationTo,
                                    hint: const Text('Select Relocation To'),
                                    items: snapshot.data!
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e.id,
                                            child: Text(e.locationname),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        var locatioto =
                                            moverController.locationTo;
                                        moverController.locationTo = value!;
                                        debugPrint(locatioto.toString());
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
                          const SizedBox(height: TSizes.spaceBtwInputFields),
                          TextFormField(
                            controller: moverController.dateofmovement,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Date of Movement is required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.calendar_today),
                                border:
                                    OutlineInputBorder(), //icon of text field
                                labelText:
                                    "Date of Movement" //label text of field
                                ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1980),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);

                                setState(() {
                                  moverController.dateofmovement.text =
                                      formattedDate;
                                  //set output date to TextField value.
                                });
                              } else {}
                            },
                          ),
                          const SizedBox(height: TSizes.spaceBtwInputFields),
                          TextFormField(
                            controller: moverController.comment,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please comment is required';
                              }
                              return null;
                            },
                            maxLines: null,
                            decoration: const InputDecoration(
                              labelText: "Comment",
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwInputFields),
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_parkerKey.currentState!.validate()) {
                                      moverController.createMovers();
                                    }
                                  },
                                  child: Text("Request a quote".toUpperCase())))
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
