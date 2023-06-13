import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/avatar/avatar_provider.dart';

class AvatarIcon extends ConsumerStatefulWidget {
  const AvatarIcon({
    this.imageInheritURL,
    this.filePath,
    Key? key,
  }) : super(key: key);

  // const AvatarIcon({super.key, this.imageInheritURL});
  final String? imageInheritURL;
  final String? filePath;
  @override
  ConsumerState<AvatarIcon> createState() => _AvatarIconState();
}

class _AvatarIconState extends ConsumerState<AvatarIcon> {
  dynamic test = const AssetImage("assets/images/noimage.png");

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Pilih media gambar'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      ref
                          .read(profileAvatarNotifierProvider.notifier)
                          .chooseImage(ImageSource.gallery);
                      ImageCache().clearLiveImages();
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.image),
                        ),
                        Text('Galeri'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      ref
                          .read(profileAvatarNotifierProvider.notifier)
                          .chooseImage(ImageSource.camera);
                      ImageCache().clearLiveImages();
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.camera),
                        ),
                        Text('Kamera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    ref.invalidate(profileAvatarNotifierProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? filePath = ref.watch(profileAvatarNotifierProvider);
    // filePath = (filePath != null) ? filePath : widget.filePath;
    print("=====================");
    print(filePath);
    FileImage? fileImage;
    if (filePath != null) {
      final file = File(filePath);
      fileImage = FileImage(file);
    }

    if (widget.imageInheritURL != null) {
      test = NetworkImage(widget.imageInheritURL!);
    }
    return Stack(
      children: [
        ElevatedButton(
          onPressed: () {
            myAlert();
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Theme.of(context).primaryColor, // <-- Button color
            foregroundColor: Colors.red, // <-- Splash color
          ),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(90),
              child: Image(
                fit: BoxFit.cover,
                image: fileImage ?? test,
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
            backgroundColor: Color.fromARGB(255, 221, 221, 221),
            onPressed: () {
              print("Kamera");
              ref
                  .read(profileAvatarNotifierProvider.notifier)
                  .chooseImage(ImageSource.camera);
              ImageCache().clearLiveImages();
            },
            child: Icon(
              Icons.camera_alt,
              color: Theme.of(context).primaryColor,
            ),
          ),
        )
      ],
    );
  }
}

class ProductViewAvatar extends StatelessWidget {
  const ProductViewAvatar(
      {super.key, required this.name, this.isBesar = false, this.photoURL});

  final String name;
  final String? photoURL;
  final bool isBesar;

  @override
  Widget build(BuildContext context) {
    double size = 70;
    double fontSize = 20;
    if (isBesar) {
      size = 120;
      fontSize = 30;
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0), //or 15.0
      child: Container(
        height: size,
        width: size,
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: (photoURL == null)
            ? Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              )
            : Image.network(
                photoURL!,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/noimage.png',
                    height: 70,
                    width: 70,
                  );
                },
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  print(frame);
                  if (frame != null || wasSynchronouslyLoaded) {
                    return child;
                  }
                  return const Center(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                height: 70,
                width: 70,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}

class PegawaiViewAvatar extends StatelessWidget {
  const PegawaiViewAvatar({super.key, this.photoURL});

  final String? photoURL;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox.fromSize(
        size: const Size.fromRadius(30),
        child: (photoURL == null)
            ? Center(
                child: Image.asset(
                  'assets/images/noimage.png',
                  height: 70,
                  width: 70,
                ),
              )
            : Image.network(
                photoURL!,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/noimage.png',
                    height: 70,
                    width: 70,
                  );
                },
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  print(frame);
                  if (frame != null || wasSynchronouslyLoaded) {
                    return child;
                  }
                  return const Center(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                height: 70,
                width: 70,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
