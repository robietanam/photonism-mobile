import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pbm_uas/src/models/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/providers/firebase_providers.dart';

import '../../../models/users.dart';
import '../../../props/utils/preferences.dart';

class UserDataSource {
  final FirebaseStorage _firebaseStorage;
  final Ref _ref; // use for reading other providers

  UserDataSource(this._firebaseStorage, this._ref);
  Future<String> saveImage(String userId, String filePath) async {
    Reference? profileImagesRef;
    Reference storageRef = _firebaseStorage.ref();

    final fileImage = File(filePath);
    profileImagesRef = storageRef.child("profile_photo/${userId}.jpg");
    await profileImagesRef.putFile(fileImage);
    final downloadURL = await profileImagesRef.getDownloadURL();
    print(downloadURL);

    return downloadURL;
  }

  Future<Either<String, User>> editProfile({
    required String id,
    required User user,
    required String email,
    required String username,
    required String namaLengkap,
    String? profileImage,
  }) async {
    print('------------Edit profile------------');
    try {
      print('Profile');

      String? linkImageNew;
      try {
        if (profileImage != null) {
          linkImageNew = await saveImage(user.id, profileImage);
        }
      } on FirebaseException catch (e) {
        return left(e.message ?? "Kesalahan saat menyimpan gambar");
      }

      final response = await http.put(
          Uri.https(ApiConstants.baseUrl, ApiConstants.profileEndPoint(id)),
          body: {
            'email': email,
            'username': username,
            'namaLengkap': namaLengkap,
            'profileImage':
                (linkImageNew == null) ? user.profileImage : linkImageNew,
          },
          headers: {
            'Authorization': 'Bearer ${user.jwt}'
          });

      print(response.body);

      if (!response.body.contains('msg')) {
        Map<String, dynamic> tojson = jsonDecode(response.body);
        tojson['token'] = user.jwt;
        final userData = User.fromJson(tojson);

        upDateSharedPreferencesUser(userData);

        return right(userData);
      } else {
        return left('Kredensial salah');
      }
    } on http.ClientException catch (e) {
      print(e.message);
      return left(e.message ?? 'Failed to Login');
    }
  }

  // Future<Either<String, User>> getProfile({
  //   required String id,
  //   required User user,
  // }) async {
  //   print('------------Edit profile------------');
  //   try {
  //     print('Profile');
  //     final response = await http.put(
  //         Uri.https(ApiConstants.baseUrl, ApiConstants.profileEndPoint(id)),
  //         body: {
  //           'email': email,
  //           'username': username,
  //           'namaLengkap': namaLengkap,
  //           'profileImage': profileImage,
  //         },
  //         headers: {
  //           'Authorization': 'Bearer ${user.jwt}'
  //         });

  //     if (!response.body.contains('msg')) {
  //       Map<String, dynamic> tojson = jsonDecode(response.body);
  //       tojson['token'] = user.jwt;
  //       final userData = User.fromJson(tojson);

  //       upDateSharedPreferencesUser(userData);

  //       return right(userData);
  //     } else {
  //       return left('Kredensial salah');
  //     }
  //   } on http.ClientException catch (e) {
  //     print(e.message);
  //     return left(e.message ?? 'Failed to Login');
  //   }
  // }
}

final userDataSourceProvider = Provider<UserDataSource>(
  (ref) => UserDataSource(ref.read(firebaseStorageProvider), ref),
);
