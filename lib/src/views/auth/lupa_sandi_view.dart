import 'package:flutter/material.dart';

import '../../props/theme/textfont.dart';
import '../../props/widgets/custom_text_button.dart';
import '../../props/widgets/custom_text_field.dart';

class LupaSandiView extends StatelessWidget {
  LupaSandiView({super.key});

  TextEditingController password = TextEditingController();
  TextEditingController passwordUlang = TextEditingController();
  TextEditingController passwordBaru = TextEditingController();

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
              controller: password,
              icon: const Icon(Icons.key_outlined),
              labelText: 'Password',
              hintText: 'Masukkan password',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordUlang,
              icon: const Icon(Icons.key_outlined),
              labelText: 'Ulangi Password',
              hintText: 'Ulangi password',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordBaru,
              icon: const Icon(Icons.key_outlined),
              labelText: 'Password baru',
              hintText: 'Masukkan password baru',
            ),
            const SizedBox(height: 30),
            CustomTextJudul(
              text: "Ubah sandi",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
