// To parse this JSON data, do
//
//     final gifts = giftsFromJson(jsonString);

import 'dart:convert';

Gifts giftsFromJson(String str) => Gifts.fromJson(json.decode(str));

String giftsToJson(Gifts data) => json.encode(data.toJson());

class Gifts {
  Gifts({
    required this.count,
    required this.result,
  });

  int count;
  List<Result> result;

  factory Gifts.fromJson(Map<String, dynamic> json) => Gifts(
        count: json["count"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.price,
    required this.deleted,
    required this.dt,
    required this.points,
    required this.img,
  });

  String id;
  String name;
  String price;
  String deleted;
  DateTime dt;
  String points;
  String img;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        deleted: json["deleted"],
        dt: DateTime.parse(json["dt"]),
        points: json["points"],
        img: json["IMG"] ??
            'http://adminapp.tech/streamkar/assets/gifts/60c32a55dd7f1_002-tool.png',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "deleted": deleted,
        "dt": dt.toIso8601String(),
        "points": points,
        "IMG": img,
      };
}
