import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../app/app_setup.logger.dart';

class FireStorageService{
  final _log = getLogger((FireStorageService).toString());
  final storage = FirebaseStorage.instance;

  double _uploadProgress = 0;

  double get uploadProgress => _uploadProgress;

  Future<String?> uploadImage(File file, dirPath, String type)async{
    final String rPath = "docs/$type/$dirPath";
    Reference storageRef = storage.ref("$rPath");
    String imageUrl = '';
    try{
      _log.i("Trying this to storage");
      // var reff = storageRef.putFile(file).snapshotEvents.listen((event) async{
      //   _uploadProgress = event.bytesTransferred/event.totalBytes;
      //   if(event.state== TaskState.success){
      //     imageUrl =  await event.ref.getDownloadURL();
      //   }
      // });
      if(kIsWeb){
        TaskSnapshot ref = await storageRef.putFile(file);
        imageUrl = await ref.ref.getDownloadURL();
        return imageUrl;
      }
      }
    catch(e){
      _log.e(e);
    }
  }



  // Future<dynamic> uploadWithProgressReport({
  //   required File file,
  //   required String name,
  //   required String dirPath,
  //   Function(double progress)? progressReport,
  //   required Function(String url) onFinish,
  // }) async {
  //   String path = "schools/${_domain.split('.').first}/$dirPath";
  //
  //   Reference reference = storage.ref(path).child("$name");
  //
  //   reference.putFile(file).snapshotEvents.listen((event) async {
  //     double progress = event.bytesTransferred / event.totalBytes;
  //
  //     if (progressReport != null) progressReport(progress);
  //
  //     if (event.state == TaskState.success) {
  //       onFinish(await event.ref.getDownloadURL());
  //     }
  //   });
  // }
}