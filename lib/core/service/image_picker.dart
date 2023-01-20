import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app_setup.locator.dart';
import '../../app/app_setup.logger.dart';

export 'package:image_picker/image_picker.dart' show ImageSource;

final _log = getLogger("ImagePickerService");

class ImagePickerService {
  // Future<XFile?> pickImage({ImageSource source = ImageSource.gallery}) async {
  //   PickedFile? selectedFile = await ImagePicker.platform.pickImage(
  //       source: source, maxHeight: 560, maxWidth: 720, imageQuality: 70);
  //   if (selectedFile != null) {
  //     return File(selectedFile.path);
  //   }
  // }

  Future<Uint8List?> getImage() async{
    Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    if(bytesFromPicker!=null){
      return bytesFromPicker;
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
