import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageRepo {
  static final ImageRepo _singleton = ImageRepo._internal();

  factory ImageRepo() {
    return _singleton;
  }

  Future<String> uploadPictureStorage(File selectedPicture) async {
    try {
      var _stamp = DateTime.now();
      UploadTask _task = FirebaseStorage.instance
          .ref("/fshares/imagen_${_stamp}.png")
          .putFile(selectedPicture);
      await _task;
      return _task.storage
          .ref("/fshares/imagen_${_stamp}.png")
          .getDownloadURL();
    } catch (e) {
      print("No se pudo subir la imagen");
      return "";
    }
  }

  Future<File?> getImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return pickedFile != null ? File(pickedFile.path) : null;
    }
  }

  ImageRepo._internal();
}
