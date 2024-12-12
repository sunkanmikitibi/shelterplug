import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/screen/shelterplug_edge/edge_screen.dart';

class ParkerMoverDetail extends StatelessWidget {
  const ParkerMoverDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Parker and Movers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade100),
          height: 600,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/success.png'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Successful',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const EdgeScreen());
                    },
                    child: const Text('Go Back')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
