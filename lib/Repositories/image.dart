import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Image {
  static final Image _singleton = Image._internal();
  File? _selectedPicture;

  factory Image() {
    return _singleton;
  }

  Future<String> _uploadPictureStorage() async {
    try {
      if (_selectedPicture == null) return "";
      var _stamp = DateTime.now();
      UploadTask _task = FirebaseStorage.instance
          .ref("/fshares/imagen_${_stamp}.png")
          .putFile(_selectedPicture!);
      await _task;
      return _task.storage
          .ref("/fshares/imagen_${_stamp}.png")
          .getDownloadURL();
    } catch (e) {
      print("No se pudo subir la imagen");
      return "";
    }
  }

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      _selectedPicture = File(pickedFile.path);
    } else {
      _selectedPicture != null ? _selectedPicture : null;
    }
  }

  Image._internal();
}
