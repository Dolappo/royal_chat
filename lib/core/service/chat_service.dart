import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:royal_chat/core/service/firebase_storage_service.dart';
import 'package:royal_chat/core/service/image_picker.dart';

import '../../app/app_setup.locator.dart';
import '../model/chat_model.dart';
import 'firestore_service.dart';

class ChatService{
  final _imagePicker = locator<ImagePickerService>();
  final _storage = locator<FireStorageService>();
  XFile? _selectedImage;
  final _fstore = locator<FirestoreService>();
  String? get currentUser => _fstore.userEmail ?? "";
  String? _imageUrl;

  String? get imageUrl => _imageUrl;

  
  Future<String?> uploadImageToStorage() async{
    print("uploading Image");
    String imageName = _selectedImage!.path.split("/").first;
    _imageUrl = await _storage.uploadImage(File(_selectedImage!.path), imageName, "img");
    print("uploading Image");
    return _imageUrl;
  }


  Uint8List? _webImage;
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    _selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (_selectedImage != null) {
      var f = await _selectedImage!.readAsBytes();
      _webImage = f;
      // notifyListeners();
    } else {
      print("No file selected");
    }
  }

  Future<void> sendImage(ChatModel chat) async{
    print("sending Image");
    await _fstore.messageCollection.add(chat.toJson());
  }





  // Uint8List? _webImage;
  // Future<void> pickImage() async {
  //   _selectedImage = await _imagePicker.getImage();
  //   if (_selectedImage != null) {
  //     var f = await _selectedImage!.readAsBytes();
  //     _webImage = f;
  //     print("image selected");
  //   } else {
  //     print("No file selected");
  //   }
  // }

  // Future<File?> get _selectedImage async =>await  _imagePicker.pickImage();

  Uint8List get webImage => _webImage!;


}