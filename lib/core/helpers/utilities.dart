import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';


@lazySingleton
class Utilities{
  Future<List<File>> getImages(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final ImagePicker picker = ImagePicker();
    final List<XFile> photos = await picker.pickMultiImage();
    if (photos.isNotEmpty) {
      List<File> imagesFile = photos.map((e) => File(e.path)).toList();
      return imagesFile;
    } else {
      return [];
    }
  }

  Future<File> getImageFromCamera(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    File imageFile = File(photo!.path);
    return imageFile;
  }
}