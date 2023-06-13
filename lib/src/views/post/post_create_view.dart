import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:pbm_uas/src/controller/state/homepage/homepage_provider.dart';
import 'package:pbm_uas/src/props/theme/textfont.dart';
import 'package:pbm_uas/src/props/widgets/alert.dart';

import '../../controller/avatar/avatar_provider.dart';
import '../../controller/posts/provider/posts_provider.dart';
import '../../models/users.dart';
import '../../props/utils/location_service.dart';
import 'location_picker_view.dart';
import 'post_page_view.dart';

class PostCreatePageView extends ConsumerStatefulWidget {
  const PostCreatePageView({
    super.key,
    required double this.width,
    required this.height,
    required this.user,
  });

  final double width;
  final double height;
  final User user;

  @override
  ConsumerState<PostCreatePageView> createState() => _PostCreatePageViewState();
}

class _PostCreatePageViewState extends ConsumerState<PostCreatePageView> {
  late double width;
  late double height;

  late User user;

  late TextEditingController deskripsiController;
  @override
  void initState() {
    super.initState();
    width = widget.width;
    height = widget.height;
    deskripsiController = TextEditingController();

    user = widget.user;
  }

  @override
  void dispose() {
    ref.invalidate(postAvatarNotifierProvider);
    super.dispose();
  }

  bool _isLoading = false;

  String lokasiString = '';
  PickedData? dataLokasi;
  Map<String?, File?> listImage = {};
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetToRender = [];
    listImage = ref.watch(postAvatarNotifierProvider);

    print('rebuildling');

    if (listImage.isNotEmpty) {
      listImage.forEach((key, value) {
        widgetToRender.add(
          Container(
            padding: const EdgeInsets.all(4),
            width: 150,
            height: 150,
            child: Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(postAvatarNotifierProvider.notifier)
                            .croppedImage(key: key!, fileImage: value)
                            .then((value) {
                          setState(() {});
                        });
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Image.file(
                            value!,
                            fit: BoxFit.cover,
                            scale: 10,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: IconButton(
                          onPressed: () {
                            ref
                                .watch(postAvatarNotifierProvider.notifier)
                                .delete(key!)
                                .then((value) {
                              setState(() {});
                            });
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
    }

    ref.watch(postsNotifierProvider).maybeWhen(
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
      successBuat: (post) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (_isLoading) {
            Navigator.pop(context);
            _isLoading = false;
          }
          ref.read(pageWidgetProvider.notifier).setPage(0);
          myAlertSuccess(context: context, text: 'Post berhasil dibuat');
        });
      },
    );

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
                      onPressed: () {
                        ref
                            .read(postAvatarNotifierProvider.notifier)
                            .chooseImageMulti()
                            .then((value) {
                          setState(() {});
                        });
                      },
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
                      onPressed: () {
                        ref
                            .read(postAvatarNotifierProvider.notifier)
                            .kamera()
                            .then((value) {
                          setState(() {});
                        });
                        ImageCache().clearLiveImages();
                      },
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
              (widgetToRender.isNotEmpty)
                  ? Container(
                      height: 150,
                      padding: EdgeInsets.all(8),
                      child: ListView(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: widgetToRender,
                      ))
                  : Container(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    AvatarUserIcon(imageLink: 'none'),
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
                          onPressed: () async {
                            final location = LocationService();
                            // final status = await location.getStatus();
                            // if (!status) {
                            //   showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         content: Container(
                            //           child: Column(
                            //             children: [Icon(Icons.error_outline)],
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //   );
                            // } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LocationPickerPage(),
                              ),
                            ).then((value) {
                              print('VALUE : ${value.toString()}');
                              if (value != null) {
                                setState(() {
                                  dataLokasi = value;
                                  lokasiString = value.address;
                                });
                              }
                            });

                            //       );
                            // showDialog(
                            //   context: context,
                            //   builder: (context) {
                            //     return AlertDialog(
                            //       content: Text('Hello'),
                            //     );
                            //   },
                            // );
                          },
                          icon: Icon(
                            Icons.location_pin,
                            color: Theme.of(context).colorScheme.onSecondary,
                          )),
                    )
                  ],
                ),
              ),
              TextDeskripsi1(
                text: lokasiString,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (dataLokasi != null) {
                      if (listImage.isNotEmpty) {
                        ref.read(postsNotifierProvider.notifier).createPost(
                            user: user,
                            photo:
                                listImage.values.map((e) => e!.path).toList(),
                            desc: deskripsiController.text,
                            location: [
                              dataLokasi!.latLong.latitude,
                              dataLokasi!.latLong.longitude
                            ]);
                      } else {
                        myAlertError(
                            context: context,
                            text: 'Pilih foto terlebih dahulu');
                      }
                    } else {
                      myAlertError(
                          context: context,
                          text: 'Pilih lokasi terlebih dahulu');
                    }
                    // ref.read(pageWidgetProvider.notifier).setPage(0);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40)),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.post_add_outlined),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Posting'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
