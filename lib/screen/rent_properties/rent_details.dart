import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
import '../../model/property.dart';

class RentDetailsScreen extends StatelessWidget {
  final Property property;
  const RentDetailsScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(property.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.asset(
                  property.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 70,
                left: 20,
                child: Text(
                  property.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      color: Colors.orange,
                    ),
                    width: 100,
                    height: 35,
                    child: Text(
                      property.type,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Positioned(
                bottom: 45,
                left: 20,
                child: Text(
                  property.city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  NumberFormat.currency(symbol: '\u{20A6}', decimalDigits: 2)
                      .format(property.amount),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: Image.asset("assets/icons/double-bed.png"),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems/2,
                            ),
                            Row(
                              children: [
                                Text(property.bedrooms.toString()),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text('Bedrooms')
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: Image.asset(
                                "assets/icons/bath.png",
                              ),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems / 2,
                            ),
                            Row(
                              children: [
                                Text(property.bathrooms.toString()),
                                const SizedBox(width: 5,),
                                const Text('Bathrooms')
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Text(property.title, style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Text('Fully furnished 4bedrooms terrace duplex. '
                      'The property, complete with a 30-seat screening room, a 100-seat '
                      'amphitheater and a swimming pond with sandy beach and outdoor shower, '
                      'was asking about 40 million. Lorem ipsum dolor sit amet, '
                      'consectetur adipis Vi ales elit vitae lo bortis faucibus. '
                      'consectetu ctetur adipis iales.  l be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy.'),
                  Text(property.property_address),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.withOpacity(0.5),
                          side: const BorderSide(
                          style: BorderStyle.solid,
                          width: 1,
                          color: Colors.black
                        ),),
                        onPressed: (){},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.chat),
                            Text('Chat')
                          ],
                        ),
                      )),
                      const SizedBox(width: TSizes.spaceBtwItems,),
                      Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green,),
                        onPressed: () {},
                        child: const Text('View Phone'),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.favorite_border_outlined),
                            Text('Favorite'),
                          ],
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
