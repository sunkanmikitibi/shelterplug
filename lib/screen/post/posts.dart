import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:intl/intl.dart';
import 'package:realestateapi/model/post.dart'; 
import 'package:realestateapi/screen/post/post_details.dart';
import 'package:realestateapi/data/services/rent_services.dart';

import 'widget/blog_item.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post>? posts;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  getPosts() async {
    posts = await RentServices.getAllPosts();
    if (posts != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ShelterPlug Blog"),

      ),
      body: Visibility(
        visible: isLoading,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: posts?.length ?? 0,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () => Get.to(() => PostDetails(post: posts![index])),
                  child: BlogItem(
                    posts: posts,
                    title: posts![index].title,
                    imageurl: posts![index].postImage,
                    description: Bidi.stripHtmlIfNeeded(posts![index].body),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
