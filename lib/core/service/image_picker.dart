import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app_setup.locator.dart';
import '../../app/app_setup.logger.dart';

export 'package:image_picker/image_picker.dart' show ImageSource;

final _log = getLogger("ImagePickerService");

class ImagePickerService {
  Future<File?> pickImage({ImageSource source = ImageSource.gallery}) async {
    PickedFile? selectedFile = await ImagePicker.platform.pickImage(
        source: source, maxHeight: 560, maxWidth: 720, imageQuality: 70);
    if (selectedFile != null) {
      return File(selectedFile.path);
    }
  }

  Future<List<File>?> pickImages({
    ImageSource source = ImageSource.gallery,
  }) async {
    List<File> selections = [];

    List<PickedFile>? selectedFiles =
        await ImagePicker.platform.pickMultiImage();

    if (selectedFiles != null) {
      for (PickedFile pickedFile in selectedFiles) {
        File _imageFile = File(pickedFile.path);
        selections.add(_imageFile);
        final bytes = await _imageFile.readAsBytes();
        return selections;
      }
    }
  }
}

class _CompressObject {
  File imageFile;
  String path;
  int rand;

  _CompressObject(this.imageFile, this.path, this.rand);
}
