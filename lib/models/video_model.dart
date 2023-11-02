// To parse this JSON data, do
//
//     final Video = VideoFromJson(jsonString);

import 'dart:convert';

List<Video> videoFromJson(String str) => List<Video>.from(json.decode(str).map((x) => Video.fromJson(x)));

String videoToJson(List<Video> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Video {
    String videoId;
    String title;
    String image;
    String url;
    String category;

    Video({
        required this.videoId,    
        required this.title,    
        required this.image,
        required this.url,
        required this.category,
    });

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        videoId: json["videoId"],    
        title: json["title"],    
        image: json["image"],
        url: json["url"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "videoId": videoId,     
        "title": title,    
        "image": image,
        "url": url,
        "category": category,
    };
}
