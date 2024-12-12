import 'package:flutter/material.dart';
import 'package:realestateapi/screen/widgets/emoji_text.dart';
import 'package:realestateapi/screen/widgets/rent_properties.dart';
import 'package:realestateapi/screen/widgets/search_input.dart';
import 'package:realestateapi/screen/shortlets/shortlets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          EmojiText(),
          SearchInput(),
          RentProperties(),
          AdsWidget(),
          ShortletScreen(),
          AdsWidget(),
        ],
      ),
    );
  }
}

class AdsWidget extends StatelessWidget {
  const AdsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 20,
        bottom: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey.withOpacity(0.2), 
        ),
        child: Image.asset(
          'assets/images/sheltermockuo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
