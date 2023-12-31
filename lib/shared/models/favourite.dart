// To parse this JSON data, do
//
//     final favourites = favouritesFromJson(jsonString);

import 'dart:convert';

List<Favourites> favouritesFromJson(String str) => List<Favourites>.from(json.decode(str).map((x) => Favourites.fromJson(x)));

String favouritesToJson(List<Favourites> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Favourites {
    String id;
    String email;
    String name;
    int v;

    Favourites({
        required this.id,
        required this.email,
        required this.name,
        required this.v,
    });

    factory Favourites.fromJson(Map<String, dynamic> json) => Favourites(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "__v": v,
    };
}
