// To parse this JSON data, do
//
//     final tags = tagsFromJson(jsonString);

import 'dart:convert';

Tags tagsFromJson(String str) => Tags.fromJson(json.decode(str));

String tagsToJson(Tags data) => json.encode(data.toJson());

class Tags {
  Tags({
    required this.count,
    required this.result,
  });

  int count;
  List<Result> result;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
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
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
