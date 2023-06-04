import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pbm_uas/src/props/theme/textfont.dart';

import '../../props/paints/login_paint.dart';
import '../../props/widgets/custom_text_button.dart';
import '../../props/widgets/custom_text_field.dart';

class SignUpPageView extends StatelessWidget {
  const SignUpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/app-icon.png';
    TextEditingController nama = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController passwordUlang = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0x00000000),
      ),
      body: SingleChildScrollView(
        child: CustomPaint(
          painter: RPSCustomPainter(),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    assetName,
                    width: 180,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 25.0, left: 25.0, right: 25.0, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
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
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: passwordUlang,
                              icon: const Icon(Icons.key_outlined),
                              labelText: 'Konfirmasi kata sandi',
                              hintText: 'Masukkan kata sandi',
                            ),
                            const SizedBox(height: 60),
                            CustomTextJudul(
                              text: "Masuk",
                              onPressed: () {},
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
