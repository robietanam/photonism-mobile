import 'dart:convert';

class Post {
  final List<dynamic> photo;
  final String desc;
  final List<dynamic> location;
  final List<dynamic> likes;
  final String userId;
  final String postId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Post(
    this.photo,
    this.desc,
    this.location,
    this.likes,
    this.userId,
    this.postId,
    this.createdAt,
    this.updatedAt,
  );

  Post.fromJson(Map<String, dynamic> json)
      : photo = json['photo'],
        desc = json['desc'],
        location = json['location'],
        likes = json['likes'],
        userId = json['userId'],
        createdAt = DateTime.parse(json['createdAt']),
        updatedAt = DateTime.parse(json['updatedAt']),
        postId = json['_id'];

  Map<String, dynamic> toJson() => {
        'photo': photo,
        'desc': desc,
        'location': location,
        'likes': likes,
        'userId': userId,
        'postId': postId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class Posts {
  final List<Post> posts;

  Posts(
    this.posts,
  );

  static Posts fromJson(Map<String, dynamic> json) {
    final posts = json['posts'];
    List<Post> toSave = [];
    for (var post in posts) {
      final postToSave = Post.fromJson(post);
      toSave.add(postToSave);
    }
    return Posts(toSave);
  }

  Map<String, dynamic> toJson() => {
        'posts': posts,
      };
}
