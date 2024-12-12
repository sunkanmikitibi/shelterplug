import 'package:flutter/material.dart';
import 'package:realestateapi/utils/constants/colours.dart';

class EmojiText extends StatefulWidget {
  const EmojiText({super.key});

  @override
  State<EmojiText> createState() => _EmojiTextState();
}

class _EmojiTextState extends State<EmojiText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 17,
      ),
      child: RichText(
        text: const TextSpan(children: [
          TextSpan(
            text: 'Find Your Home',
            style: TextStyle(
              color: kFont,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          )
        ]),
      ),
    );
  }
}
