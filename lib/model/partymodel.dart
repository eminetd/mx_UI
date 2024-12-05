// To parse this JSON data, do
//
//     final PartyModel = PartyModelFromJson(jsonString);

import 'dart:convert';

PartyModel partyModelFromJson(String str) =>
    PartyModel.fromJson(json.decode(str));

String partyModelToJson(PartyModel data) => json.encode(data.toJson());

class PartyModel {
  PartyModel({
    required this.result,
  });

  List<Result> result;

  factory PartyModel.fromJson(Map<String, dynamic> json) => PartyModel(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.pname,
    required this.image,
  });

  String pname;
  String image;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pname: json["pname"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "pname": pname,
        "image": image,
      };
}
