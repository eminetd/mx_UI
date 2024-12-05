// To parse this JSON data, do
//
//     final userDetailsFromUserid = userDetailsFromUseridFromJson(jsonString);

import 'dart:convert';

UserDetailsFromUserid userDetailsFromUseridFromJson(String str) =>
    UserDetailsFromUserid.fromJson(json.decode(str));

String userDetailsFromUseridToJson(UserDetailsFromUserid data) =>
    json.encode(data.toJson());

class UserDetailsFromUserid {
  UserDetailsFromUserid({
    required this.message,
    required this.result,
  });

  String message;
  Result result;

  factory UserDetailsFromUserid.fromJson(Map<String, dynamic> json) =>
      UserDetailsFromUserid(
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.userid,
    required this.userType,
    required this.name,
    this.nickname,
    this.info,
    required this.mobile,
    required this.email,
    required this.password,
    required this.profilePic,
    this.address,
    this.landmark,
    this.state,
    this.city,
    this.dob,
    this.gender,
    required this.isVerified,
    required this.status,
    required this.createdDatetime,
    required this.modifiedDatetime,
    required this.langid,
    this.thirdPartyToken,
    this.gid,
    required this.privacy,
    required this.balance,
    required this.dbalance,
  });

  String userid;
  String userType;
  String name;
  dynamic nickname;
  dynamic info;
  String mobile;
  String email;
  String password;
  String profilePic;
  dynamic address;
  dynamic landmark;
  dynamic state;
  dynamic city;
  dynamic dob;
  dynamic gender;
  String isVerified;
  String status;
  DateTime createdDatetime;
  DateTime modifiedDatetime;
  String langid;
  dynamic thirdPartyToken;
  dynamic gid;
  String privacy;
  String balance;
  String dbalance;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        userid: json["USERID"],
        userType: json["USER_TYPE"],
        name: json["NAME"],
        nickname: json["NICKNAME"],
        info: json["INFO"],
        mobile: json["MOBILE"],
        email: json["EMAIL"],
        password: json["PASSWORD"],
        profilePic: json["PROFILE_PIC"],
        address: json["ADDRESS"],
        landmark: json["LANDMARK"],
        state: json["STATE"],
        city: json["CITY"],
        dob: json["DOB"],
        gender: json["GENDER"],
        isVerified: json["IS_VERIFIED"],
        status: json["STATUS"],
        createdDatetime: DateTime.parse(json["CREATED_DATETIME"]),
        modifiedDatetime: DateTime.parse(json["MODIFIED_DATETIME"]),
        langid: json["LANGID"],
        thirdPartyToken: json["THIRD_PARTY_TOKEN"],
        gid: json["gid"],
        privacy: json["privacy"],
        balance: json["balance"],
        dbalance: json["dbalance"],
      );

  Map<String, dynamic> toJson() => {
        "USERID": userid,
        "USER_TYPE": userType,
        "NAME": name,
        "NICKNAME": nickname,
        "INFO": info,
        "MOBILE": mobile,
        "EMAIL": email,
        "PASSWORD": password,
        "PROFILE_PIC": profilePic,
        "ADDRESS": address,
        "LANDMARK": landmark,
        "STATE": state,
        "CITY": city,
        "DOB": dob,
        "GENDER": gender,
        "IS_VERIFIED": isVerified,
        "STATUS": status,
        "CREATED_DATETIME": createdDatetime.toIso8601String(),
        "MODIFIED_DATETIME": modifiedDatetime.toIso8601String(),
        "LANGID": langid,
        "THIRD_PARTY_TOKEN": thirdPartyToken,
        "gid": gid,
        "privacy": privacy,
        "balance": balance,
        "dbalance": dbalance,
      };
}
