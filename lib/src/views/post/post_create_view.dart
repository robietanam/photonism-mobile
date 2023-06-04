import 'package:flutter/material.dart';
import 'package:pbm_uas/src/props/theme/textfont.dart';

import '../homepage/homepage_main.dart';

class PostCreatePageView extends StatefulWidget {
  const PostCreatePageView({
    super.key,
    required double this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  State<PostCreatePageView> createState() => _PostCreatePageViewState();
}

class _PostCreatePageViewState extends State<PostCreatePageView> {
  late double width;
  late double height;
  late TextEditingController deskripsiController;
  @override
  void initState() {
    super.initState();
    width = widget.width;
    height = widget.height;
    deskripsiController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 400.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(8),
                child: TextJudul1(
                  text: 'Posting',
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/galery-icon.png',
                      scale: 3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Pilih foto dari perangkat anda'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextJudul(
                      text: 'atau',
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Kamera'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    AvatarUserIcon(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextJudul2(
                        text: 'Avatar',
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: deskripsiController,
                  decoration: const InputDecoration(
                    hintText: 'Tulis caption...',
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                  ),
                  minLines: 4,
                  maxLines: 4,
                  maxLength: 2000,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextJudul2(
                      text: 'Tambahkan Lokasi',
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('Hello'),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.location_pin,
                            color: Theme.of(context).colorScheme.onSecondary,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
