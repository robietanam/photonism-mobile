import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class AvatarNotifier extends StateNotifier<String?> {
  AvatarNotifier() : super(null);

  File? file;

  void chooseImage(ImageSource media) async {
    XFile? imagePick;
    File? image;

    imagePick = await ImagePicker().pickImage(source: media);

    if (imagePick != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePick.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        cropStyle: CropStyle.rectangle,
        compressQuality: 20,
      );

      if (croppedFile != null) {
        file = File(croppedFile.path);

        String nameFile = imagePick.name;
        Directory tmpPath = await getTemporaryDirectory();

        String path = "${tmpPath.path}/tmp_profile";

        await Directory(path).create(recursive: true);

        // if (Directory(path).existsSync()) {
        //   Directory(path).deleteSync(recursive: true);
        // }

        // copy the file to a new path
        image = await file?.copy('$path/$nameFile.png');
        print(image?.path);
        state = image?.path;
      }
    }
  }
}

class PostMultiNotifier extends StateNotifier<Map<String?, File?>> {
  PostMultiNotifier() : super({});
  var uuid = Uuid();

  File? file;
  Future<void> kamera() async {
    final imagePick = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagePick != null) {
      state.addEntries(<String, File>{uuid.v4(): File(imagePick.path)}.entries);
    }
  }

  Future<void> croppedImage(
      {required String key, required File fileImage}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: fileImage.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      cropStyle: CropStyle.rectangle,
      compressQuality: 20,
    );

    if (croppedFile != null) {
      file = File(croppedFile.path);
      state.update(key, (value) => file);
    }
  }

  Future<void> chooseImageMulti() async {
    Map<String?, File?> imagePickList = {};
    List<XFile> image;

    image = await ImagePicker().pickMultiImage();

    if (image.isNotEmpty) {
      for (XFile img in image) {
        imagePickList
            .addEntries(<String, File>{uuid.v4(): File(img.path)}.entries);
      }
    }
    state.addAll(imagePickList);
  }

  Future<void> delete(String id) async {
    state.remove(id);
  }
}

class PostEditMultiNotifier
    extends StateNotifier<Map<String?, ImageProvider?>> {
  PostEditMultiNotifier() : super({});
  var uuid = Uuid();

  File? file;

  Future<void> addNetworkImage(List<dynamic> urlFoto) async {
    Map<String?, NetworkImage?> imageNetworkList = {};
    List<XFile> image;

    for (var url in urlFoto) {
      imageNetworkList.addEntries(
          <String, NetworkImage>{uuid.v4(): NetworkImage(url)}.entries);
    }

    state.addAll(imageNetworkList);
  }

  Future<void> kamera() async {
    final imagePick = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imagePick != null) {
      state.addEntries(<String, ImageProvider>{
        uuid.v4(): FileImage(File(imagePick.path))
      }.entries);
    }
  }

  Future<void> croppedImage(
      {required String key, required FileImage fileImage}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: fileImage.file.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      cropStyle: CropStyle.rectangle,
      compressQuality: 20,
    );

    if (croppedFile != null) {
      file = File(croppedFile.path);
      state.update(key, (value) => FileImage(file!));
    }
  }

  Future<void> chooseImageMulti() async {
    Map<String?, FileImage?> imagePickList = {};
    List<XFile> image;

    image = await ImagePicker().pickMultiImage();

    if (image.isNotEmpty) {
      for (XFile img in image) {
        imagePickList.addEntries(<String, FileImage>{
          uuid.v4(): FileImage(
            File(img.path),
          )
        }.entries);
      }
    }
    state.addAll(imagePickList);
  }

  Future<void> delete(String id) async {
    state.remove(id);
  }
}

final profileAvatarNotifierProvider =
    StateNotifierProvider<AvatarNotifier, String?>((ref) => AvatarNotifier());

final postAvatarNotifierProvider =
    StateNotifierProvider<PostMultiNotifier, Map<String?, File?>>(
        (ref) => PostMultiNotifier());

final postEditAvatarNotifierProvider =
    StateNotifierProvider<PostEditMultiNotifier, Map<String?, ImageProvider?>>(
        (ref) => PostEditMultiNotifier());
