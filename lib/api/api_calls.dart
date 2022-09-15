import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/models/componentDetails.dart';

Future<String> uploadImageToStorage(File imageFile) async {
  // mention try catch later on

  try {
    Reference _storageReference = FirebaseStorage.instance
        .ref()
        .child('${DateTime.now().millisecondsSinceEpoch}');
    UploadTask storageUploadTask = _storageReference.putFile(imageFile);
    String url = await (await storageUploadTask).ref.getDownloadURL();
    // print(url);
    return url;
  } catch (e) {
    return '';
  }
}

Future<void> addComponentToDB(ComponentDetails details) async {
  Map<String, dynamic> data = details.toJson();
  await FirebaseFirestore.instance
      .collection('components')
      .doc(data['uid'])
      .set(data);
}

Future<List<ComponentDetails>> getComponentsFromDB() async {
  List<ComponentDetails> components = [];
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('components').get();
  querySnapshot.docs.forEach((element) {
    components.add(ComponentDetails.fromJson(element.data()));
  });
  print(components.length);
  return components;
}

Future<void> updateComponentInDB(ComponentDetails details) async {
  Map<String, dynamic> data = details.toJson();
  await FirebaseFirestore.instance
      .collection('components')
      .doc(data['uid'])
      .update(data);
}

Future<void> deleteComponentFromDB(String uid) async {
  await FirebaseFirestore.instance.collection('components').doc(uid).delete();
}
