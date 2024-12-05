// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    required this.success,
    required this.count,
    required this.result,
  });

  bool success;
  int count;
  List<Result> result;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        success: json["success"],
        count: json["count"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "count": count,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.imgUrl,
    required this.caption,
    required this.deleted,
    required this.date,
    required this.time,
    required this.userid,
    this.name,
    required this.profilePic,
    required this.totalLikes,
  });

  String id;
  String imgUrl;
  String caption;
  String deleted;
  DateTime date;
  String time;
  String userid;
  String? name;
  String profilePic;
  String totalLikes;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        imgUrl: json["img_url"],
        caption: json["caption"],
        deleted: json["deleted"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        userid: json["userid"],
        //name: json["NAME"],
        profilePic: json["PROFILE_PIC"] ?? '',
        totalLikes: json["total_likes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "img_url": imgUrl,
        "caption": caption,
        "deleted": deleted,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "userid": userid,
        "NAME": name,
        "PROFILE_PIC": profilePic,
        "total_likes": totalLikes,
      };
}
