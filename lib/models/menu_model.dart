// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

List<Menu> menuFromJson(String str) => List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

String menuToJson(List<Menu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menu {
    String menuId;
    String name;
    int price;
    String description;
    String image;
    String category;
    String detail;

    Menu({
        required this.menuId,
        required this.name,
        required this.price,
        required this.description,
        required this.image,
        required this.category,
        required this.detail,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        menuId: json["menuId"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
        category: json["category"],
        detail: json["detail"],
    );

    Map<String, dynamic> toJson() => {
        "menuId": menuId,
        "name": name,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
        "detail": detail,
    };
}
