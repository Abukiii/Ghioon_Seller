import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

Future<String> uploadImage(File? image, String Uid) async {
  String fileName = basename(image!.path);
  // String owner = userID.toString();
  print("===============");
  print(fileName);
  Reference storageRef =
      FirebaseStorage.instance.ref().child('products/$Uid/$fileName');
  await storageRef.putFile(image);
  return await storageRef.getDownloadURL();
}