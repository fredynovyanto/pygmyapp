import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pygmyapp_menu/models/video_model.dart';

class VideoProvider extends ChangeNotifier  {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Video>> streamvideo() async* {
    yield* firestore.collection("video").withConverter<Video>(
      fromFirestore: (snapshot, _) => Video.fromJson(snapshot.data()!), 
      toFirestore: (video, options) => video.toJson(),
    ).snapshots();
    notifyListeners();
  }

  Future<bool> addVideo(String title, String url, String category, String image) async {
    try{
      var hasil = await firestore.collection("video").add({
        "title": title,    
        "image": image,
        "url": url,
        "category": category,
    });
    await firestore.collection("video").doc(hasil.id).update({
        "videoId": hasil.id
    });
      return true;
    } catch(e) {
      print(e.toString());
      return false;
    }
  }

  Stream<QuerySnapshot<Video>> getVideo(String category) async* {
    yield* firestore.collection("video").withConverter<Video>(
      fromFirestore: (snapshot, _) => Video.fromJson(snapshot.data()!), 
      toFirestore: (video, options) => video.toJson(),
    ).where("category", isEqualTo: category).snapshots();
    notifyListeners();
  }

  Future<bool> deleteVideo(String videoId) async {
    try{
      var snapshot = await firestore.collection("video").limit(1).where("videoId", isEqualTo: videoId).get();
      var hasil = snapshot.docs[0];
      hasil.reference.delete();
      
      return true;
    } catch(e) {
      print(e.toString());
      return false;
    }
  }
}