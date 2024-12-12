import 'package:flutter/material.dart';

class EmptyFavoriteScreen extends StatelessWidget {
  const EmptyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Add Empty Image
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/images/empty_list.png'),
              ),
            ),
            //Add Empty screen title
            const Text(
              'No Favourite Properties Yet',
              style: TextStyle(fontSize: 21),
            ),
            //add Empty Screen Subtitle
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Shopping for houses?\n' 'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            //add browse favorite button
            MaterialButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.green,
              onPressed: () {
           
              },
              child: const Text('Browse Properties'),
            ),
          ],
        ),
      ),
    );
  }
}
