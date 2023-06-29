import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  static Future<File?> pickImage(
    ImageSource source,
  ) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return null;
      File? img = File(image.path);

      return img;
    } on PlatformException catch (e) {
      print(e);
    }
    return null;
  }
}
