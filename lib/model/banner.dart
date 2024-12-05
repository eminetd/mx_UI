// To parse this JSON data, do
//
//     final AllBanners = AllBannersFromJson(jsonString);

import 'dart:convert';

AllBanners AllBannersFromJson(String str) =>
    AllBanners.fromJson(json.decode(str));

String AllBannersToJson(AllBanners data) => json.encode(data.toJson());

class AllBanners {
  AllBanners({
    required this.result,
    required this.count,
    required this.sliders,
  });

  String result;
  int count;
  List<Sliders> sliders;

  factory AllBanners.fromJson(Map<String, dynamic> json) => AllBanners(
        result: json["result"],
        count: json["count"],
        sliders: List.from(json["sliders"].map((x) => Sliders.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "count": count,
        "sliders": List<dynamic>.from(sliders.map((x) => x.toJson())),
      };
}

class Sliders {
  Sliders({
    required this.id,
    required this.imgUrl,
    required this.link,
    required this.cat,
  });

  String id;
  String imgUrl;
  String link;
  String cat;

  factory Sliders.fromJson(Map<String, dynamic> json) => Sliders(
        id: json["id"],
        imgUrl: json["imgUrl"],
        link: json["link"],
        cat: json["cat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imgUrl": imgUrl,
        "link": link,
        "cat": cat,
      };
}
