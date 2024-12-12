import 'package:flutter/material.dart';
import 'package:realestateapi/utils/constants/colours.dart';
import 'package:realestateapi/screen/favorite/favorites.dart';
import 'package:realestateapi/screen/shelterplug_edge/edge_screen.dart';
import 'screens.dart';
import 'accounts/accountscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const FavoriteScreen(),
    const EdgeScreen(),
    const UserAccountScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(), 
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Stack(
          children: [
            Row(
              children: [
                Builder(                  
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => Scaffold.of(context).openDrawer() ,
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          right: 10,
                        ),
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                          border: Border.all(
                            color: kFontLight.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: kFontLight,
                        ),
                      ),
                    );
                  }
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    right: 20,
                  ),
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    border: Border.all(
                      color: kFontLight.withOpacity(
                        0.3,
                      ),
                      width: 2,
                    ),
                  ),
                  child: Image.asset(
                    'assets/icons/notification.png',
                    width: 20,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 15,
              right: 29,
              child: Container(
                height: 8,
                width: 8,
                decoration:
                    const BoxDecoration(color: kAccent, shape: BoxShape.circle),
              ),
            ),
          ],
        )
      ],
      backgroundColor: kBackground,
      elevation: 0,
      centerTitle: false,
      title: const Text(
        'Hello User!',
        style: TextStyle(
          color: kFontLight,
          fontSize: 16,
        ),
      ),
    );
  }
}
