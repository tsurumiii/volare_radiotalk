import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:volare_radiotalk/common/index.dart';

Future<File> pickCropAvatarImage() async {
  return _pickCropImage(cropStyle: CropStyle.circle);
}

Future<File> pickCropThumbnailImage() async {
  return _pickCropImage(cropStyle: CropStyle.rectangle);
}

Future<File> _pickCropImage({
  CropStyle cropStyle,
}) async {
  final file = await ImagePicker.pickImage(source: ImageSource.gallery);
  if (file == null) {
    return null;
  }
  final croppedFile = await ImageCropper.cropImage(
    sourcePath: file.path,
    cropStyle: cropStyle,
    aspectRatioPresets: Platform.isAndroid
        ? [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ]
        : [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9
          ],
    androidUiSettings: AndroidUiSettings(
        toolbarTitle: '',
        toolbarColor: kAppTheme,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false),
  );
  return croppedFile;
}
