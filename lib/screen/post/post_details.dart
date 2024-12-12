import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/model/post.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: post.postImage,
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Text(
                    Bidi.stripHtmlIfNeeded(post.body),
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
