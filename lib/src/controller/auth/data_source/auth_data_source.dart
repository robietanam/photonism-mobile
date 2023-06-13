import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pbm_uas/src/models/api.dart';
import '../../../core/providers/firebase_providers.dart';

import '../../../models/users.dart';
import '../../../props/utils/preferences.dart';

class AuthDataSource {
  final FirebaseStorage _firebaseStorage;
  final Ref _ref; // use for reading other providers

  AuthDataSource(this._firebaseStorage, this._ref);

  Future<Either<String, User>> login({
    required String email,
    required String password,
  }) async {
    print('------------Login------------');
    try {
      print('Masuk');
      final response = await http.post(
          Uri.https(ApiConstants.baseUrl, ApiConstants.loginEndpoint),
          body: {'email': email, 'password': password});

      if (!response.body.contains('msg')) {
        final user = User.fromJson(jsonDecode(response.body));

        upDateSharedPreferencesUser(user);

        return right(user);
      } else {
        return left('Kredensial salah');
      }
    } on http.ClientException catch (e) {
      print(e.message);
      return left(e.message ?? 'Gagal login');
    }
  }

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

  Future<Either<String, String>> signup({
    required String email,
    required String username,
    required String namaLengkap,
    String? profileImage,
    required String password,
  }) async {
    print('------------Login------------');
    try {
      print('Masuk');
      String? linkImage;

      final response = await http.post(
          Uri.https(ApiConstants.baseUrl, ApiConstants.registerEndpoint),
          body: {
            'email': email,
            'password': password,
            'username': username,
            'namaLengkap': namaLengkap,
            'profileImage': profileImage,
          });
      print(response.body);
      if (response.body.contains('duplicate key error')) {
        return left('email atau username sudah digunakan');
      }
      if (!response.body.contains('User validation failed')) {
        print(response.body);
        final user = User.fromJson(jsonDecode(response.body));

        try {
          if (profileImage != null) {
            linkImage = await saveImage(user.id, profileImage);
          }
        } on FirebaseException catch (e) {
          return left(e.message ?? "Kesalahan saat menyimpan gambar");
        }

        try {
          final responseProfile = await http.put(
              Uri.https(
                  ApiConstants.baseUrl, ApiConstants.profileEndPoint(user.id)),
              body: {
                'profileImage': linkImage,
              },
              headers: {
                'Authorization': 'Bearer ${user.jwt}'
              });
          return right('Akun sukses terdaftar');
        } on http.ClientException catch (e) {
          print(e.message);
          return left(e.message ?? 'Kesalahan saat menghubungkan api');
        }
      } else {
        return left('Gagal membuat akun');
      }
    } on http.ClientException catch (e) {
      print(e.message);
      return left(e.message ?? 'Gagal signup');
    }
  }
}

final authDataSourceProvider = Provider<AuthDataSource>(
  (ref) => AuthDataSource(ref.read(firebaseStorageProvider), ref),
);
