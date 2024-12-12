import 'dart:convert';

import 'package:realestateapi/model/post.dart';
import 'package:http/http.dart' as http;

class PostService {
  static Future<List<Post>> fetchAllPosts() async {
    const url = 'https://shelterplug.com/api/posts';

    final uri = Uri.parse(url);
    //final uri2 = Uri.parse(urlOnline);
    final response = await http.get(uri);

    final data = json.decode(response.body);

    final results = data as List<dynamic>;

    final posts = results.map((e) {
      return Post(
        title: e['title'],
        body: e['body'],
        slug: e['slug'],
        postImage: e['postImage'].toString(),
        user: e['user'],
        category: e['category']
      );
    }).toList();

    return posts;
  }
}
