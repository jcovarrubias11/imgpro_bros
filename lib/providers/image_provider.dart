import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as image_processing;
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider with ChangeNotifier {
  ImagePickerProvider.instance();

  File _imageFile;
  File get imageFile => _imageFile;

  image_processing.Image _image;
  image_processing.Image get image => _image;

  dynamic _pixels = [];
  dynamic get pixels => _pixels;

  Future getImageFromCamera() async {
    File camera_image = await ImagePicker.pickImage(source: ImageSource.camera);
    _imageFile = camera_image;
    _image = image_processing.decodeImage(camera_image.readAsBytesSync());
    _pixels = _image.getBytes();
    notifyListeners();
  }

  Future getImageFromCameraRoll() async {
    File gallery_image =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    _imageFile = gallery_image;
    _image = image_processing.decodeImage(gallery_image.readAsBytesSync());
    _pixels = _image.getBytes();
    notifyListeners();
  }
}
