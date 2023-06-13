import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbm_uas/src/props/widgets/alert.dart';

import '../../models/api.dart';
import '../../models/users.dart';
import '../../props/theme/textfont.dart';
import '../../props/widgets/custom_text_button.dart';
import '../../props/widgets/custom_text_field.dart';

import 'package:http/http.dart' as http;

class LupaSandiView extends StatelessWidget {
  LupaSandiView({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordUlang = TextEditingController();
  TextEditingController passwordBaru = TextEditingController();

  Future<bool> checkPassword(
      {required String email,
      required String passwordLama,
      required String passwordBaru}) async {
    final response = await http.post(
        Uri.https(ApiConstants.baseUrl, ApiConstants.loginEndpoint),
        body: {'email': email, 'password': passwordLama});

    if (!response.body.contains('msg')) {
      final user = User.fromJson(jsonDecode(response.body));

      final responseEdit = await http.put(
          Uri.https(
              ApiConstants.baseUrl, ApiConstants.profileEndPoint(user.id)),
          body: {
            'password': passwordBaru,
          },
          headers: {
            'Authorization': 'Bearer ${user.jwt}'
          });

      print(responseEdit.body);

      if (!responseEdit.body.contains('msg')) {
        return true;
      }
    }

    return false;
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: const TextAppBar(text: 'Lupa kata sandi'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: email,
              icon: const Icon(Icons.email),
              labelText: 'Email',
              hintText: 'Masukkan email',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: password,
              icon: const Icon(Icons.key_outlined),
              isPassword: true,
              labelText: 'Password',
              hintText: 'Masukkan password',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordBaru,
              icon: const Icon(Icons.key_outlined),
              isPassword: true,
              labelText: 'Password baru',
              hintText: 'Masukkan password baru',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordUlang,
              icon: const Icon(Icons.key_outlined),
              isPassword: true,
              labelText: 'Ulangi Password',
              hintText: 'Ulangi password',
            ),
            const SizedBox(height: 30),
            CustomTextJudul(
              text: "Ubah sandi",
              onPressed: () {
                if (email.text.isNotEmpty) {
                  if (passwordBaru.text.isNotEmpty &&
                      passwordBaru.text == passwordUlang.text &&
                      password.text.isNotEmpty) {
                    _isLoading = true;
                    myLoadingPopup(context: context)
                        .then((value) => _isLoading = false);
                    checkPassword(
                            email: email.text,
                            passwordLama: password.text,
                            passwordBaru: passwordBaru.text)
                        .then((value) {
                      if (_isLoading) {
                        Navigator.pop(context);
                      }
                      if (value) {
                        myAlertSuccess(
                            context: context,
                            text: 'Berhasil merubah password');
                      } else {
                        myAlertError(
                            context: context, text: 'Password lama salah');
                      }
                    });
                  } else {
                    myAlertError(
                        context: context, text: 'Password tidak sesuai');
                  }
                } else {
                  myAlertError(context: context, text: 'Email perlu diisi');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
