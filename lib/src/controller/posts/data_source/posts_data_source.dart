import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pbm_uas/src/models/api.dart';
import '../../../core/providers/firebase_providers.dart';

import '../../../models/posts.dart';
import '../../../models/users.dart';
import '../../../props/utils/preferences.dart';

class PostsDataSource {
  final FirebaseStorage _firebaseStorage;
  final Ref _ref; // use for reading other providers

  PostsDataSource(this._firebaseStorage, this._ref);

  Future<Either<String, Either<String, Posts>>> getFeedPosts({
    required User user,
    required int start,
    required int banyak,
  }) async {
    print('PAYLOAD FETCH $start , $banyak');
    final response = await http.get(
        Uri.https(ApiConstants.baseUrl, ApiConstants.postsEndpoint,
            {'skip': start.toString(), 'limit': banyak.toString()}),
        headers: {
          'Authorization': 'Bearer ${user.jwt}',
          'Content-type': 'application/json'
        });
    if (response.body.contains('No posts found')) {
      return right(left('Tidak ada data post lagi'));
    }
    if (!response.body.contains('failed')) {
      print(jsonDecode(response.body));
      final posts = Posts.fromJson(jsonDecode(response.body));
      return right(right(posts));
    }

    return left('Error');
  }

  Future<Either<String, Posts>> getFeedPostsPopuler({
    required User user,
  }) async {
    try {
      final response = await http.get(
          Uri.https(
            ApiConstants.baseUrl,
            ApiConstants.popularEndpoint,
          ),
          headers: {
            'Authorization': 'Bearer ${user.jwt}',
            'Content-type': 'application/json'
          });

      final posts = Posts.fromJson(jsonDecode(response.body));
      return right(posts);
    } on HttpException catch (e) {
      return left('Error');
    }
  }

  Future<Either<String, Post>> createPost({
    required User user,
    required List<String> photo,
    required String desc,
    required List<double> location,
  }) async {
    print('------------Create post------------');
    try {
      print('Masuk');

      final response = await http.post(
          Uri.https(ApiConstants.baseUrl, ApiConstants.postsEndpoint),
          body: jsonEncode({
            'desc': desc,
            'photo': ['none'],
            'location': location,
          }),
          headers: {
            'Authorization': 'Bearer ${user.jwt}',
            'Content-type': 'application/json'
          });

      print(response.body);
      if (!response.body.contains('failed')) {
        print(jsonDecode(response.body));
        final post = Post.fromJson(jsonDecode(response.body));
        int index = 0;
        List<String> linkImages = [];
        for (String p in photo) {
          index += 1;
          final linkImage = await saveImage(post.postId, p, index);
          linkImages.add(linkImage);
        }

        try {
          await http.put(
              Uri.https(ApiConstants.baseUrl,
                  ApiConstants.postIdEndPoint(post.postId)),
              body: jsonEncode({
                'desc': post.desc,
                'photo': linkImages,
              }),
              headers: {
                'Authorization': 'Bearer ${user.jwt}',
                'Content-type': 'application/json'
              });
        } on http.ClientException catch (e) {
          print("error gambar : ${e.message}");
          return left(e.message ?? 'Gagal menyimpan gambar');
        }

        print(post.toJson());
        return right(post);
      } else {
        return left('Kredensial salah');
      }
    } on http.ClientException catch (e) {
      print(e.message + "ANJING");
      return left(e.message ?? 'Gagal membuat post');
    }
  }

  Future<Either<String, Post>> editPost({
    required User user,
    required Post post,
    required Map<String?, ImageProvider<Object>?> photo,
    required String desc,
    required List<double> location,
  }) async {
    print('------------Edit post------------');
    try {
      print('Masuk');

      List<String> linkImages = [];
      int index = 0;
      print("Foto : $photo");
      try {
        for (var key in photo.keys) {
          final value = photo[key];
          print(value);
          if (value.runtimeType == FileImage) {
            index += 1;
            FileImage theValue = value as FileImage;
            final linkImage =
                await saveImage(post.postId, theValue.file.path, index);
            linkImages.add(linkImage);
          } else {
            print("THIS IS NETWORK $value");
            NetworkImage theValue = value as NetworkImage;
            linkImages.add(theValue.url);
          }
        }
      } on http.ClientException catch (e) {
        print("error gambar : ${e.message}");
        return left(e.message ?? 'Gagal menyimpan gambar');
      }

      print("Link gambar : $linkImages");
      final response = await http.put(
          Uri.https(
              ApiConstants.baseUrl, ApiConstants.postIdEndPoint(post.postId)),
          body: jsonEncode({
            'desc': desc,
            'photo': linkImages,
            'location': location,
          }),
          headers: {
            'Authorization': 'Bearer ${user.jwt}',
            'Content-type': 'application/json'
          });

      print(response.body);

      if (!response.body.contains('failed')) {
        print(jsonDecode(response.body));

        print(post.toJson());
        return right(post);
      } else {
        return left('Kredensial salah');
      }
    } on http.ClientException catch (e) {
      print(e.message + "ANJING");
      return left(e.message ?? 'Gagal membuat post');
    }
  }

  Future<String> saveImage(String postId, String filePath, index) async {
    Reference? profileImagesRef;
    Reference storageRef = _firebaseStorage.ref();

    final fileImage = File(filePath);
    profileImagesRef = storageRef.child("dataPost/${postId}_$index.jpg");
    await profileImagesRef.putFile(fileImage);
    final downloadURL = await profileImagesRef.getDownloadURL();
    print(downloadURL);

    return downloadURL;
  }
}

final postsDataSourceProvider = Provider<PostsDataSource>(
  (ref) => PostsDataSource(ref.read(firebaseStorageProvider), ref),
);
