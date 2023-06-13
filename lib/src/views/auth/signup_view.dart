import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pbm_uas/src/props/theme/textfont.dart';

import '../../controller/auth/provider/auth_provider.dart';
import '../../controller/avatar/avatar_provider.dart';
import '../../props/paints/login_paint.dart';
import '../../props/widgets/alert.dart';
import '../../props/widgets/avatar.dart';
import '../../props/widgets/custom_text_button.dart';
import '../../props/widgets/custom_text_field.dart';

import 'package:google_sign_in/google_sign_in.dart';

class SignUpPageView extends ConsumerWidget {
  SignUpPageView({super.key});

  bool _isLoading = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String assetName = 'assets/images/app-icon.png';
    TextEditingController nama = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController passwordUlang = TextEditingController();

    ref.watch(authNotifierProvider).maybeWhen(
      orElse: () {
        _isLoading = false;
      },
      loading: () {
        _isLoading = true;
        SchedulerBinding.instance.addPostFrameCallback((_) {
          myLoadingPopup(context: context).then((value) {
            _isLoading = false;
          });
        });
      },
      success: (message) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (_isLoading) {
            Navigator.pop(context);
            _isLoading = false;
          }
          myAlertSuccess(context: context, text: message ?? 'Akun sukses');
        });
      },
      failed: (message) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (_isLoading) {
            Navigator.pop(context);
            _isLoading = false;
          }
          myAlertError(
              context: context, text: message ?? 'Telah terjadi error');
        });
      },
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        elevation: 0,
        backgroundColor: const Color(0x00000000),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 25.0, left: 25.0, right: 25.0, top: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextJudul(
                            text: "Ayo daftarkan dirimu sekarang!",
                            color: Theme.of(context).primaryColor,
                          ),
                          const TextSubJudul(
                            text: "Isi form dibawah ini untuk daftar",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AvatarIcon(),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: username,
                            icon: const Icon(Icons.person_outline),
                            labelText: 'Username',
                            hintText: 'Masukkan username',
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: nama,
                            icon: const Icon(Icons.person_outline),
                            labelText: 'Nama',
                            hintText: 'Masukkan namamu',
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: email,
                            icon: const Icon(Icons.email_outlined),
                            labelText: 'Email',
                            hintText: 'Masukkan email',
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: password,
                            icon: const Icon(Icons.key_outlined),
                            labelText: 'Kata sandi',
                            hintText: 'Masukkan kata sandi',
                            isPassword: true,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: passwordUlang,
                            icon: const Icon(Icons.key_outlined),
                            labelText: 'Konfirmasi kata sandi',
                            hintText: 'Masukkan kata sandi',
                            isPassword: true,
                          ),
                          const SizedBox(height: 60),
                          CustomTextJudul(
                            text: "Daftar",
                            onPressed: () {
                              final image =
                                  ref.read(profileAvatarNotifierProvider);
                              if (password.text == passwordUlang.text) {
                                if (username.text
                                    .contains(RegExp(r'^[A-Za-z0-9_]+$'))) {
                                  ref
                                      .read(authNotifierProvider.notifier)
                                      .signup(
                                        email: email.text,
                                        username: username.text,
                                        namaLengkap: nama.text,
                                        profileImage: image,
                                        password: password.text,
                                      );
                                } else {
                                  myAlertError(
                                      context: context,
                                      text:
                                          'Username tidak boleh menggunakan karakter spesial');
                                }
                              } else {
                                myAlertError(
                                    context: context,
                                    text: 'Password tidak sama');
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(children: <Widget>[
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text("Atau"),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SignInButton(
                            text: 'Pakai email google',
                            padding: const EdgeInsets.all(10),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            Buttons.Google, onPressed: () async {
                          final googleSignIn = GoogleSignIn();
                          final GoogleSignInAccount? googleUser =
                              await googleSignIn.signIn();

                          if (googleUser != null) {
                            email.value =
                                TextEditingValue(text: googleUser.email);
                            nama.value = TextEditingValue(
                                text: googleUser.displayName ?? '');

                            await GoogleSignIn().disconnect();
                          }
                        }),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
