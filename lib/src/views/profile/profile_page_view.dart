import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pbm_uas/src/props/theme/textfont.dart';
import 'package:pbm_uas/src/props/widgets/custom_text_field.dart';
import 'package:pbm_uas/src/views/auth/login_view.dart';

import '../../controller/state/scroll/scroll_provider.dart';

class ProfilePageView extends ConsumerStatefulWidget {
  const ProfilePageView({super.key});

  @override
  ConsumerState<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends ConsumerState<ProfilePageView> {
  late TextEditingController namaController;
  late TextEditingController usernameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('edit');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.red,
                    ),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(90),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/noimage.png'),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 0,
                    child: FloatingActionButton(
                      onPressed: () {
                        print("edit");
                      },
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  TextJudul1(
                    text: "Salahudin Mahmud",
                    color: Theme.of(context).primaryColor,
                  ),
                  TextDeskripsi1(
                    text: '@salahudin123',
                    color: Theme.of(context).colorScheme.onSecondary,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextJudul2(
                          text: 'Nama',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      CustomTextField(
                        controller: namaController,
                        icon: const Icon(Icons.person),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextJudul2(
                          text: 'Username',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      CustomTextField(
                        controller: usernameController,
                        icon: const Icon(Icons.person),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextJudul2(
                          text: 'Email',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      CustomTextField(
                        controller: emailController,
                        icon: const Icon(Icons.email_outlined),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                alignment: Alignment.centerLeft,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.save),
                  ),
                  Text('Simpan'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(scrollPositionProvider);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPageView(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.centerLeft,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.exit_to_app),
                  ),
                  Text('Keluar'),
                ],
              ),
            ),
            const SizedBox(
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}
