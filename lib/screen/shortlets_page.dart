import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/model/properties.dart';
import 'package:realestateapi/data/services/rent_services.dart';

class ShortletPage extends StatefulWidget {
  const ShortletPage({super.key});

  @override
  State<ShortletPage> createState() => _ShortletPageState();
}

class _ShortletPageState extends State<ShortletPage> {
  List<Property>? shortlets;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getShortlets();
  }

  getShortlets() async {
    shortlets = await RentServices().getRentProperties();

    if (shortlets != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shortlets"),),
      body: Visibility(
        visible: isLoading,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
            itemCount: shortlets?.length ?? 0,
            itemBuilder: (context, index) {
               
              final property = shortlets![index];
              final amount = int.parse(property.amount);
      
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            property.image,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Positioned(
                        bottom: 50,
                        left: 20,
                        child: Text(
                          property.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                    Positioned(
                      bottom: 30,
                      left: 20,
                      child: Text(
                        NumberFormat.currency(
                          locale: 'en_NG', decimalDigits: 2,
                          symbol: '\u{20A6}',                        
                        ).format(amount),                   
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
