import 'dart:convert';

Topusers topusersFromJson(String str) => Topusers.fromJson(json.decode(str));

String topusersToJson(Topusers data) => json.encode(data.toJson());

class Topusers {
  Topusers({
    required this.count,
    required this.result,
  });

  int count;
  List<Result> result;

  factory Topusers.fromJson(Map<String, dynamic> json) => Topusers(
        count: json["count"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "result": result,
        "count": count,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.USERID,
    required this.USER_TYPE,
    required this.NAME,
    required this.NICKNAME,
    required this.INFO,
    required this.MOBILE,
    required this.EMAIL,
    required this.PASSWORD,
    required this.PROFILE_PIC,
    required this.ADDRESS,
    required this.LANDMARK,
    required this.STATE,
    required this.CITY,
    required this.DOB,
    required this.GENDER,
    required this.IS_VERIFIED,
    required this.STATUS,
    required this.CREATED_DATETIME,
    required this.LANGID,
    required this.MODIFIED_DATETIME,
    required this.THIRD_PARTY_TOKEN,
    required this.gid,
    required this.privacy,
    required this.balance,
    required this.dbalance,
  });

  String USERID;
  String USER_TYPE;
  String NAME;
  String NICKNAME;
  String INFO;
  String MOBILE;
  String EMAIL;
  String PASSWORD;
  String PROFILE_PIC;
  String ADDRESS;
  String LANDMARK;
  String STATE;
  String CITY;
  String DOB;
  String GENDER;
  String IS_VERIFIED;
  String STATUS;
  String CREATED_DATETIME;
  String LANGID;
  String MODIFIED_DATETIME;
  String THIRD_PARTY_TOKEN;
  String gid;
  String privacy;
  String balance;
  String dbalance;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        USERID: json["USERID"],
        USER_TYPE: json["USER_TYPE"],
        NAME: json["NAME"],
        NICKNAME: json["NICKNAME"] ?? '',
        INFO: json["INFO"] ?? '',
        MOBILE: json["MOBILE"] ?? '',
        EMAIL: json["EMAIL"],
        PASSWORD: json["PASSWORD"] ?? '',
        PROFILE_PIC: json["PROFILE_PIC"],
        ADDRESS: json["ADDRESS"] ?? '',
        LANDMARK: json["LANDMARK"] ?? '',
        STATE: json["STATE"] ?? '',
        CITY: json["CITY"] ?? '',
        DOB: json["DOB"] ?? '',
        GENDER: json["GENDER"] ?? '',
        IS_VERIFIED: json["IS_VERIFIED"],
        CREATED_DATETIME: json["CREATED_DATETIME"],
        LANGID: json["LANGID"],
        MODIFIED_DATETIME: json["MODIFIED_DATETIME"],
        THIRD_PARTY_TOKEN: json["THIRD_PARTY_TOKEN"] ?? '',
        gid: json["gid"] ?? '',
        privacy: json["privacy"],
        balance: json["balance"],
        dbalance: json["dbalance"],
        STATUS: '',
      );

  Map<String, dynamic> toJson() => {
        "USERID": USERID,
        "USER_TYPE": USER_TYPE,
        "NAME": NAME,
        "NICKNAME": NICKNAME,
        "INFO": INFO,
        "MOBILE": MOBILE,
        "EMAIL": EMAIL,
        "PASSWORD": PASSWORD,
        "PROFILE_PIC": PROFILE_PIC,
        "ADDRESS": ADDRESS,
        "LANDMARK": LANDMARK,
        "STATE": STATE,
        "CITY": CITY,
        "DOB": DOB,
        "GENDER": GENDER,
        "IS_VERIFIED": IS_VERIFIED,
        "CREATED_DATETIME": CREATED_DATETIME,
        "LANGID": LANGID,
        "MODIFIED_DATETIME": MODIFIED_DATETIME,
        "THIRD_PARTY_TOKEN": THIRD_PARTY_TOKEN,
        "gid": gid,
        "privacy": privacy,
        "balance": balance,
        "dbalance": dbalance,
      };
}




// // To parse this JSON data, do
// //
// //     final topusers = topusersFromJson(jsonString);

// import 'dart:convert';

// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// Topusers topusersFromJson(String str) => Topusers.fromJson(json.decode(str));

// String topusersToJson(Topusers data) => json.encode(data.toJson());

// class Topusers {
//   Topusers({
//     required this.count,
//     required this.result,
//   });

//   int count;
//   List<Result> result;

//   factory Topusers.fromJson(Map<String, dynamic> json) => Topusers(
//         count: json["count"],
//         result: List<Result>.from(json["result"].map((x) =>
//             Map.from(x).map(
//                 (k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
//       );

//   Map<String, dynamic> toJson() => {
//         "count": count,
//         "result": List<dynamic>.from(result.map((x) => Map.from(x).map(
//             (k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
//       };
//       class
// }
