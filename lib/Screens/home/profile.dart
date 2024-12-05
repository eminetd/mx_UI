import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:mtstreamapp/Screens/user/usericon/mypeoples/following.dart';
import 'package:mtstreamapp/service/service.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Profile extends StatefulWidget {
  final String? uname;
  final String? proimage;

  const Profile({Key? key, this.uname, this.proimage}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //bool follow = false;
  int counter = 0;

  String? status = '1';
  String? follow = '';
  String? follow_to = 'frdgtyh';
  List? listresponse;
  bool isfollowing = false;
  int followers = 0;
  String userid = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: follow == '400'
      //     ? FloatingActionButton.extended(
      //         backgroundColor: colors.gradient2pink,
      //         onPressed: () {
      //           // follower(FirebaseAuth.instance.currentUser?.uid, '4',
      //           //     FirebaseAuth.instance.currentUser?.displayName);
      //         },
      //         label: Text("unfollow"),
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20)),
      //       )
      floatingActionButton: Row(
        children: [
          FloatingActionButton.extended(
            heroTag: 'Follow',
            backgroundColor: colors.gradient2pink,
            extendedPadding: EdgeInsets.symmetric(horizontal: 50),
            onPressed: () async {
              // followuser(FirebaseAuth.instance.currentUser!.uid,
              //     FirebaseAuth.instance.currentUser!.uid);
              setState(() {
                isfollowing = true;
                followers++;
                FirebaseFirestore.instance
                    .collection('/follow')
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .set({
                  'count': 1,
                }).then((value) {
                  FirebaseFirestore.instance
                      .collection('/follow')
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .collection("/follows")
                      .doc(FirebaseAuth.instance.currentUser?.displayName)
                      .set({
                    "user": FirebaseAuth.instance.currentUser?.displayName,
                  });
                });
              });
            },
            label: Text("Follow"),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          FloatingActionButton.extended(
            heroTag: 'Unfollow',
            backgroundColor: colors.gradient2pink,
            extendedPadding: EdgeInsets.symmetric(horizontal: 50),
            onPressed: () async {
              // followuser(FirebaseAuth.instance.currentUser!.uid,
              //     FirebaseAuth.instance.currentUser!.uid);
              setState(() {
                isfollowing = false;
                followers--;
                FirebaseFirestore.instance
                    .collection('/follow')
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .set({
                  'count': 0,
                }).then((value) {
                  FirebaseFirestore.instance
                      .collection('/follow')
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .collection("/follows")
                      .doc(FirebaseAuth.instance.currentUser?.displayName)
                      .delete();
                });
              });
            },
            label: Text("Un Follow"),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ],
      ),

      body: Stack(
        children: [
          Container(
            height: 330,
            child: Image.network(
              widget.proimage.toString(),
              width: 500,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 230, left: 20),
            child: Text(
              widget.uname.toString(),
              style: TextStyle(color: colors.mywhite, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 270),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors.yellow,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.person,
                            size: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            '21',
                            style:
                                TextStyle(fontSize: 15, color: colors.myblack),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 20,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors.myred,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Activate',
                            style:
                                TextStyle(fontSize: 15, color: colors.mywhite),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors.gradient2pink,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(
                            FontAwesomeIcons.rankingStar,
                            size: 18,
                            color: colors.mywhite,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            '20',
                            style:
                                TextStyle(fontSize: 15, color: colors.mywhite),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors.gradient1purple,
                    ),
                    child: Center(
                      child: Text(
                        'Love',
                        style: TextStyle(fontSize: 15, color: colors.mywhite),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors.gradient2pink,
                    ),
                    child: Center(
                      child: Text(
                        'Join',
                        style: TextStyle(fontSize: 15, color: colors.mywhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300, left: 20),
            child: Text(
              'Date',
              style: TextStyle(
                color: colors.mywhite,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350, left: 20),
            child: Row(
              children: [
                Text(
                  'Squad Intro',
                  style: TextStyle(
                    color: colors.myblack,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 380, left: 20),
            child: Row(
              children: [
                Text(
                  'Top up 99889999899889',
                  style: TextStyle(color: colors.mygrey, fontSize: 17),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 420, left: 20),
            child: Row(
              children: [
                Text(
                  'Squad Memebers',
                  style: TextStyle(
                    color: colors.myblack,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    '(  )',
                    style: TextStyle(
                      color: colors.myblack,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 170),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 450, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: colors.transparent,
                  maxRadius: 40,
                  child: Image.asset('assets/crown1.png'),
                ),
                CircleAvatar(
                  backgroundColor: colors.transparent,
                  maxRadius: 40,
                  child: Image.asset('assets/crown1.png'),
                ),
                CircleAvatar(
                  backgroundColor: colors.transparent,
                  maxRadius: 40,
                  child: Image.asset('assets/crown1.png'),
                ),
                CircleAvatar(
                  backgroundColor: colors.transparent,
                  maxRadius: 40,
                  child: Image.asset('assets/crown1.png'),
                ),
                CircleAvatar(
                  backgroundColor: colors.transparent,
                  maxRadius: 40,
                  child: Image.asset('assets/crown1.png'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 520, left: 20),
            child: Row(
              children: [
                Text(
                  'Squad Status',
                  style: TextStyle(
                    color: colors.myblack,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 240),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 560),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/3stream.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/3stream.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/3stream.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/3stream.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// follower(FirebaseAuth.instance.currentUser?.uid, '1',
//     FirebaseAuth.instance.currentUser?.displayName);
// setState(() {
//   FirebaseFirestore.instance
//       .collection('/followers')
//       .doc("${FirebaseAuth.instance.currentUser!.uid}")
//       .collection('/allfollowers')
//       .doc()
//       .get()
//       .then((value) {
//     setState(() {
//       FirebaseFirestore.instance
//           .collection('/followers')
//           .doc("${FirebaseAuth.instance.currentUser!.uid}")
//           .collection('/allfollowers')
//           .doc()
//           .get()
//           .then((value) => counter = value['counter']);

//       print(counter);
//       FirebaseFirestore.instance
//           .collection('/followers')
//           .doc(FirebaseAuth.instance.currentUser?.uid)
//           .collection('/allfollowers')
//           .doc()
//           .set({
//         'counter': counter + 1,
//         'follow': true,
//       });
//     });

//     // print(value.data()!["counter"]);
//   });
// });
// Future follower(String? uid, String? index, String? name) async {
//   var url = Uri.parse('http://adminapp.tech/streamkar/userapi/follow.php');
//   var Param = {
//     'USERID': uid,
//     'STATUS': index,
//     'FOLLOW_TO': name,
//   };
//   var response = await post(url, body: Param);
//   final data = json.decode(response.body);
//   print(data);
//   if (response.statusCode == 200) {
//     print('${data['follwers']}');
//     follow = data['error'];
//     Fluttertoast.showToast(msg: '${data['message']}');
//   } else {
//     print('fail');
//   }
// }
