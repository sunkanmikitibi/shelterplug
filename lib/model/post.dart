import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  final String title;
  final String slug;
  final String body;
  final String postImage;
  final User user;
  final List<Category> category;

  Post({
    required this.title,
    required this.slug,
    required this.body,
    required this.postImage,
    required this.user,
    required this.category,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json["title"],
        slug: json["slug"],
        body: json["body"],
        postImage: json["post_image"],
        user: User.fromJson(json["user"]),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "body": body,
        "post_image": postImage,
        "user": user.toJson(),
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  final int id;
  final String title;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  Category({
    required this.id,
    required this.title,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  final String postId;
  final String categoryblgId;

  Pivot({
    required this.postId,
    required this.categoryblgId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        postId: json["post_id"],
        categoryblgId: json["categoryblg_id"],
      );

  Map<String, dynamic> toJson() => {
        "post_id": postId,
        "categoryblg_id": categoryblgId,
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final String profilePhotoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePhotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "profile_photo_url": profilePhotoUrl,
      };
}
