import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pygmyapp_menu/models/menu_model.dart';

class MenuProvider extends ChangeNotifier  {
  String _imagePath = "";
  String get imagePath => _imagePath;
  
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Menu>> streamMenu() async* {
    yield* firestore.collection("menu").withConverter<Menu>(
      fromFirestore: (snapshot, _) => Menu.fromJson(snapshot.data()!), 
      toFirestore: (menu, options) => menu.toJson(),
    ).snapshots();
    notifyListeners();
  }

  Stream<QuerySnapshot<Menu>> getMenu(String category) async* {
    yield* firestore.collection("menu").withConverter<Menu>(
      fromFirestore: (snapshot, _) => Menu.fromJson(snapshot.data()!), 
      toFirestore: (menu, options) => menu.toJson(),
    ).where("category", isEqualTo: category).snapshots();
    notifyListeners();
  }

  Future<bool> addMenu(String name, int price, String description, String image, String category, String detail) async {
    try{
      var hasil = await firestore.collection("menu").add({
      "name": name,
      "description": description,
      "price": price,
      "image": image,
      "category": category,
      "detail": detail,
    });
      await firestore.collection("menu").doc(hasil.id).update({
        "menuId": hasil.id
    });
      return true;
    } catch(e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> editMenu(String menuId, String name, int price, String description, String image, String category, String detail) async {
    try{
      await firestore.collection("menu").doc(menuId).update({
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "category": category,
        "detail": detail,
      });
      return true;
    } catch(e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> deleteMenu(String menuId) async {
    try{
      var snapshot = await firestore.collection("menu").limit(1).where("menuId", isEqualTo: menuId).get();
      var hasil = snapshot.docs[0];
      hasil.reference.delete();

      return true;
    } catch(e) {
      print(e.toString());
      return false;
    }
  }

  Future<String> uploadImage(File imageFile) async {
    String fileName = basename(imageFile.path);

    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = ref.putFile(imageFile);
    TaskSnapshot snapshot = await task.whenComplete(() {});
    String path = await snapshot.ref.getDownloadURL();
    return path;
  }

  Future<File> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    final File imageFile = File(image!.path);
    int imlength  = await imageFile.length();
    if(imlength > 1000000)
    {
      return File("");
    }
    return imageFile;
  }

  void setImagePath(String path) {
    _imagePath = path;
    notifyListeners();
  }

  void disposeValues() {
    _imagePath = "";
    notifyListeners();
  }
}