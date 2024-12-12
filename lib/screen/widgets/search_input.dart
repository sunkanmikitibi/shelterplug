import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/screen/searchpage/search_page.dart';
import 'package:realestateapi/utils/constants/colours.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_dropdown.dart';
import 'package:realestateapi/utils/constants/color.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  List currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  TextEditingController searchTextController = TextEditingController();
  static const String prefSearchKey = 'previousSearches';

  List<String> previousSearches = <String>[];


  void savePreviousSearches() async {
    // 1
    final prefs = await SharedPreferences.getInstance();
    // 2
    prefs.setStringList(prefSearchKey, previousSearches);
  }

  @override
  void initState() {
    // implement initState
    super.initState();
    getPreviousSearches();
  }

  @override
  void dispose() {
    // implement dispose
    super.dispose();
    searchTextController.clear();
  }

  //  Add getPreviousSearches
  void getPreviousSearches() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSearchKey)) {
      final searches = prefs.getStringList(prefSearchKey);
      if (searches != null) {
        previousSearches = searches;
      } else {
        previousSearches = <String>[];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              border: Border.all(
                color: kFontLight.withOpacity(
                  0.3,
                ),
                width: 2,
              ),
            ),
            child: Card(
              child: TextField(
                onSubmitted: (value) {
                  if (!previousSearches.contains(value)) {
                    previousSearches.add(value);
                    savePreviousSearches();

                  }
                },
                autofocus: false,
                controller: searchTextController,
                cursorColor: kFontLight,
                decoration: InputDecoration(
                  fillColor: kFontLight.withOpacity(0.1),
                  filled: true,
                  contentPadding: const EdgeInsets.all(
                    10,
                  ),
                  border: InputBorder.none,
                  hintText: 'Search for Buy, Rent, Shortlets,...',
                  hintStyle: const TextStyle(
                    color: kFontLight,
                  ),
                ),
              ),
            ),            
          ),
          Positioned(
            top: 15,
            right: 5,
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.arrow_drop_down, size: 32, color: TColors.lightGrey,),
                onSelected: (String value) {
                searchTextController.text = value;
                startSearch(searchTextController.text);
                },
                itemBuilder: (BuildContext context){
                return previousSearches.map<CustomDropdownMenuItem<String>>((String value) =>
                    CustomDropdownMenuItem<String>(value: value, text: value, callback: () {
                      setState(() {
                        previousSearches.remove(value);
                        Navigator.pop(context);
                      });
                    },)).toList();
            }),
          ),
          Positioned(
            right: 30,
            top: 5,
            child: Container(
              padding: const EdgeInsets.all(
                8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: IconButton(
                icon: const Icon(
                  Iconsax.search_normal,
                  size: 18,
                  color: Colors.white,
                ),
                onPressed: () {
                  startSearch(searchTextController.text);
                  debugPrint(searchTextController.text);
                  Get.to(() => const SearchPage());
                  final currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


  void startSearch(String value) {

    setState(() {
      currentSearchList.clear();
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = true;
      value = value.trim();
      if (!previousSearches.contains(value)) {
        previousSearches.add(value);
        savePreviousSearches();
      }
    });
  }
}
