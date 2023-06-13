import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pbm_uas/src/props/widgets/alert.dart';

import '../../controller/auth/provider/auth_provider.dart';
import '../../controller/avatar/avatar_provider.dart';
import '../../props/paints/login_paint.dart';
import '../../props/theme/textfont.dart';
import '../../props/widgets/custom_text_button.dart';
import '../../props/widgets/custom_text_field.dart';
import '../homepage/homepage_main.dart';
import '../props/loading_screen.dart';
import 'lupa_sandi_view.dart';
import 'signup_view.dart';

class LoginPageView extends ConsumerStatefulWidget {
  LoginPageView({super.key});

  @override
  ConsumerState<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends ConsumerState<LoginPageView> {
  bool _isLoading = false;

  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/app-icon.png';
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    if (_isLogin) {
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
        unauthenticated: (message) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if (_isLoading) {
              Navigator.pop(context);
              _isLoading = false;
            }
            myAlertError(
                context: context, text: message ?? 'Telah terjadi error');
          });
        },
        authenticated: (user) {
          print(user);
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if (_isLoading) {
              Navigator.pop(context);
              _isLoading = false;
            }
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageView(user: user),
              ),
            );
          });
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: CustomPaint(
          painter: RPSCustomPainter(),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    assetName,
                    width: 180,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 25.0, left: 25.0, right: 25.0, top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              TextJudul(
                                text: "Selamat datang kembali",
                                color: Theme.of(context).primaryColor,
                              ),
                              const TextSubJudul(
                                text: "Masuk kembali ke akun anda",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                              labelText: 'Password',
                              hintText: 'Masukkan password',
                              isPassword: true,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LupaSandiView(),
                                    ),
                                  );
                                },
                                child: const Text('Ubah kata sandi? '),
                              ),
                            ),
                            const SizedBox(height: 30),
                            CustomTextJudul(
                              text: "Masuk",
                              onPressed: () {
                                print('CLicked');
                                ref.read(authNotifierProvider.notifier).login(
                                    email: email.text, password: password.text);
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => HomePageView(),
                                //   ),
                                // );
                              },
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Belum punya akan?'),
                                TextButton(
                                  onPressed: () {
                                    ref.invalidate(authNotifierProvider);
                                    _isLogin = false;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpPageView(),
                                      ),
                                    ).then((value) {
                                      setState(() {
                                        _isLogin = true;
                                        ref.invalidate(
                                            profileAvatarNotifierProvider);
                                      });
                                    });
                                  },
                                  child: const Text('Daftar'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
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
      ),
    );
  }
}
