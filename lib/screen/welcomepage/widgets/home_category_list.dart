
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../searchpage/search_page.dart';
import 'category_list_item.dart';

class THomeCategoryList extends StatelessWidget {
  const THomeCategoryList({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryListItem(
                title: 'title',
                onTap: () {
                  Get.to(() => const SearchPage());
                },
              );
            }),
      );

  }
}
