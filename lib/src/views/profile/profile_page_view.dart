import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pbm_uas/src/controller/auth/provider/auth_provider.dart';
import 'package:pbm_uas/src/props/theme/textfont.dart';
import 'package:pbm_uas/src/props/widgets/custom_text_field.dart';
import 'package:pbm_uas/src/views/auth/login_view.dart';

import '../../controller/avatar/avatar_provider.dart';
import '../../controller/state/scroll/scroll_provider.dart';
import '../../controller/user/provider/user_provider.dart';
import '../../models/users.dart';
import '../../props/utils/preferences.dart';
import '../../props/widgets/alert.dart';
import '../../props/widgets/avatar.dart';

class ProfilePageView extends ConsumerStatefulWidget {
  const ProfilePageView({super.key, required this.user});

  final User user;
  @override
  ConsumerState<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends ConsumerState<ProfilePageView> {
  late TextEditingController namaController;
  late TextEditingController usernameController;
  late TextEditingController emailController;

  late String? image;

  late User user;
  @override
  void initState() {
    super.initState();

    user = widget.user;
    image = user.profileImage;
    print(image);

    namaController = TextEditingController(text: user.namaLengkap);
    usernameController = TextEditingController(text: user.username);
    emailController = TextEditingController(text: user.email);
  }

  @override
  void dispose() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   ref.invalidate(profileAvatarNotifierProvider);
    // });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userDataNotifierProvider).maybeWhen(
          orElse: () {},
          success: (userData) {
            user = userData;
          },
        );
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
                  AvatarIcon(imageInheritURL: image),
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
                    text: user.namaLengkap,
                    color: Theme.of(context).primaryColor,
                  ),
                  TextDeskripsi1(
                    text: '@${user.username}',
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
              onPressed: () {
                final imagePathNew = ref.read(profileAvatarNotifierProvider);
                if (usernameController.text
                    .contains(RegExp(r'^[A-Za-z0-9_]+$'))) {
                  ref.read(userDataNotifierProvider.notifier).editProfile(
                      id: user.id,
                      user: user,
                      email: emailController.text,
                      username: usernameController.text,
                      namaLengkap: namaController.text,
                      profileImage: imagePathNew);
                } else {
                  myAlertError(
                      context: context,
                      text:
                          'Username tidak boleh menggunakan karakter spesial');
                }
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
                ref.invalidate(authNotifierProvider);
                removeSharedPreferencesUser();
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
