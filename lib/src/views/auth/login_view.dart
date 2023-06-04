import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../props/paints/login_paint.dart';
import '../../props/theme/textfont.dart';
import '../../props/widgets/custom_text_button.dart';
import '../../props/widgets/custom_text_field.dart';
import '../homepage/homepage_main.dart';
import 'lupa_sandi_view.dart';
import 'signup_view.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/app-icon.png';
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

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
                                child: const Text('Lupa kata sandi? '),
                              ),
                            ),
                            const SizedBox(height: 30),
                            CustomTextJudul(
                              text: "Masuk",
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePageView(),
                                  ),
                                );
                              },
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Belum punya akan?'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpPageView(),
                                      ),
                                    );
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
                            text: 'Masuk dengan google',
                            padding: const EdgeInsets.all(10),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            Buttons.Google,
                            onPressed: () {},
                          ),
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
