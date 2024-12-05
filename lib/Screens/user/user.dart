// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mtstreamapp/Screens/home/homepage.dart';
import 'package:mtstreamapp/Screens/home/live_page.dart';
import 'package:mtstreamapp/Screens/home/tv_page.dart';
import 'package:mtstreamapp/Screens/user/add_status.dart';
import 'package:mtstreamapp/Screens/user/comments.dart';
import 'package:mtstreamapp/Screens/user/editprofile.dart';
import 'package:mtstreamapp/model/posts.dart';
import 'package:mtstreamapp/service/service.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_share2/whatsapp_share2.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  FirebaseAuth auth = FirebaseAuth.instance;
  ScrollController _controller = ScrollController();
  int count = 0;
  String? userid = '';
  String? post_id = '2';
  int counter = 0;
  File? image = null;
  bool _isShowDial = false;
  bool isliked = false;
  String UserProfilename = "";
  String imageUrl = "";
  int follower = 0;
  int index = 2;
  bool isSelected = false;
  Future<void> share(String url) async {
    await WhatsappShare.share(
      text: 'share your  Dil do Story',
      linkUrl: url,
      phone: '91xxxxxxxxxx',
    );
  }

  late SharedPreferences preferences;
  getuserid() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future pickImage(ImageSource source) async {
    try {
      final Image =
          await ImagePicker().pickImage(source: source, imageQuality: 25);
      if (Image == null) return;

      image = File(Image.path);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AddStatus(
          image: image!.path,
        );
      }));
      // if (image != null) {
      //   //Upload to Firebase
      //   String images = '';

      //   var snapshot = await FirebaseStorage.instance
      //       .ref()
      //       .child('images/myimage$count')
      //       .putFile(image!);
      //   var downloadUrl = await snapshot.ref.getDownloadURL().then((value) {
      //     setState(() {
      //       images = value;
      //       count++;
      //       print(value);
      //     });
      //     FirebaseFirestore.instance
      //         .collection("/status")
      //         .doc(FirebaseAuth.instance.currentUser!.uid)
      //         .collection('/post')
      //         .doc()
      //         .set({'image': images});
      //     FirebaseFirestore.instance.collection('/allpost').doc().set({
      //       'image': images,
      //     });
      //     setState(() {
      //       count++;
      //     });
      //   });
      // } else {
      //   print('No Image Path Received');
      // }

      // // final imagePermanent = await saveImagePermanent(image!.path);
      // setState(() {
      //   //image = null;
      // });
    } on PlatformException catch (e) {
      print('failed to pick image:$e');
    }
  }

  List<Widget> pages = [Homepage(), Tv(), Live(), Comments(), UserProfile()];

  int currentIndex = 0;

  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  fetchdata() {
    if (FirebaseAuth.instance.currentUser != null) {
      UserProfilename =
          FirebaseAuth.instance.currentUser!.displayName.toString();
      imageUrl = FirebaseAuth.instance.currentUser!.photoURL.toString();
    } else {
      FacebookAuth.instance.getUserData().then((userData) {
        setState(() {
          UserProfilename = userData.entries.first.value;
        });
      });
    }
    FirebaseFirestore.instance
        .collection('/Dp')
        .doc("text")
        .get()
        .then((value) {
      setState(() {
        imageUrl = value['imageurl'];
      });
    });
    FirebaseFirestore.instance
        .collection('/${auth.currentUser?.uid}')
        .doc("test")
        .get()
        .then((value) {
      setState(() {
        //UserProfilename = value['Username'];
      });
    });
  }

  List<Posts> posts = [];
  Future<List<Posts>> status() async {
    var url = Uri.parse(baseURL + 'all_apis.php?func=posts');
    var Param = {'func': 'posts'};
    var response = await post(url, body: Param);

    final data = json.decode(response.body);

    print(data);
    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        final dataFuture = postsFromJson(response.body);
        dataFuture.result
            .map((e) => posts
                .add(Posts(success: true, count: 2, result: dataFuture.result)))
            .toList();
        print(data);
      }
    }
    return posts;
  }

  likeunlike() async {
    userid = preferences.getString('USERID');
    var url = Uri.parse(baseURL + 'all_apis.php?func=add_remove_like');
    var Param = {'userid': userid, 'post_id': '1'};
    var reponse = await post(url, body: Param);
    final data = json.decode(reponse.body);

    print(data);

    if (reponse.statusCode == 200) {
      Fluttertoast.showToast(msg: data['message']);
    }
  }

  dislike() async {
    userid = preferences.getString('USERID');
    var url = Uri.parse(baseURL + 'all_apis.php?func=add_remove_like');
    var Param = {'userid': userid, 'post_id': "2"};
    var reponse = await post(url, body: Param);
    final data = json.decode(reponse.body);

    print(data);

    if (reponse.statusCode == 200) {
      Fluttertoast.showToast(msg: data['message']);
    }
  }
  // String? message;
  // _scrollListener() {
  //   if (_controller.offset >= _controller.position.maxScrollExtent &&
  //       !_controller.position.outOfRange) {
  //     setState(() {
  //       message = "reach the bottom";
  //       Fluttertoast.showToast(msg: message.toString());
  //     });
  //   }
  //   if (_controller.offset <= _controller.position.minScrollExtent &&
  //       !_controller.position.outOfRange) {
  //     setState(() {
  //       message = "reach the top";
  //       Fluttertoast.showToast(msg: message.toString());
  //     });
  //   }
  // }

  int beans = 0;
  int diamond = 0;
  HashSet<String> selectItem = HashSet();
  @override
  void initState() {
    getuserid();
    // _controller = ScrollController();
    // _controller.addListener(_scrollListener);
    fetchdata();
    // FirebaseFirestore.instance
    //     .collection('/beans')
    //     .doc(FirebaseAuth.instance.currentUser?.uid)
    //     .get()
    //     .then((value) {
    //   beans = value["beans"];
    //   // diamond = value['diamond'] ?? 0;
    // });
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseFirestore.instance
          .collection('/follow')
          .doc("${FirebaseAuth.instance.currentUser!.uid}")
          .collection('/follows')
          .snapshots()
          .listen((value) {
        follower = value.size;

        // print(value.data()!["counter"]);
      });
    }
    // print(FirebaseAuth.instance.currentUser?.uid);
    // print(FirebaseAuth.instance.currentUser?.displayName);

    super.initState();
  }

  void multipleSelection(String image) async {
    if (selectItem.contains(image)) {
      dislike();
      selectItem.remove(image);
    } else {
      likeunlike();
      selectItem.add(image);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //floating actionbuton
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   backgroundColor: colors.mywhite,
        //   child: Icon(
        //     Icons.add,
        //     color: colors.myred,
        //     size: 35,
        //   ),
        // ),
        body: RefreshIndicator(
          onRefresh: () => fetchdata(),
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                Container(
                    height: 350,
                    width: 500,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      colors.gradient1purple,
                      colors.myred,
                      // colors.pinkaccent,
                    ])),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Editprofile()));
                                  },
                                  child:
                                      Icon(Icons.edit, color: colors.mywhite)),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/settings');
                                  },
                                  child: Icon(
                                    Icons.settings,
                                    color: colors.mywhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: SizedBox(
                                height: 150,
                                width: 150,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage("$imageUrl"),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 260),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${UserProfilename}",
                                style: TextStyle(
                                    color: colors.mywhite, fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 300, left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ID:8568686',
                                style: TextStyle(
                                    color: colors.mywhite, fontSize: 18),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '|',
                                  style: TextStyle(
                                      color: colors.mywhite, fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'INDIA',
                                  style: TextStyle(
                                      color: colors.mywhite, fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/diamond.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '$beans',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90),
                        child: Image.asset("assets/diamond.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '$diamond',
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '0',
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          '$follower',
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          '0',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Friends',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Text(
                          'Followers',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Following',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: colors.mybluegrey,
                  height: 15,
                  indent: 15,
                  endIndent: 15,
                ),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('/usericon')
                              .orderBy('id')
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              return InkWell(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.pushNamed(context, '/topup');
                                  } else if (index == 1) {
                                    Navigator.pushNamed(context, '/talent');
                                  } else if (index == 2) {
                                    Navigator.pushNamed(context, '/mytask');
                                  } else if (index == 3) {
                                    Navigator.pushNamed(context, '/vip');
                                  } else if (index == 4) {
                                    Navigator.pushNamed(context, '/shop');
                                  } else if (index == 5) {
                                    Navigator.pushNamed(context, '/mybag');
                                  } else if (index == 6) {
                                    Navigator.pushNamed(context, '/mylevel');
                                  } else if (index == 7) {
                                    Navigator.pushNamed(context, '/mybadge');
                                  } else if (index == 8) {
                                    Navigator.pushNamed(context, '/support');
                                  } else if (index == 9) {
                                    Navigator.pushNamed(context, '/mypeople');
                                  } else if (index == 10) {
                                    Navigator.pushNamed(context, '/myroom');
                                  } else if (index == 11) {
                                    Navigator.pushNamed(context, '/');
                                  } else {
                                    Navigator.pushNamed(context, '/');
                                  }
                                },
                                child: Image.network(
                                    snapshot.data?.docs[index]['image']),
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                    }),
                Divider(
                  color: colors.mybluegrey,
                  height: 30,
                  indent: 15,
                  endIndent: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Moments',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 380,
                              height: 140,
                              child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection("/status")
                                      .doc(FirebaseAuth
                                          .instance.currentUser?.uid)
                                      .collection('/post')
                                      .snapshots(),
                                  builder: ((context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          // shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data?.docs.length
                                                      .toInt() ==
                                                  0
                                              ? 1
                                              : snapshot.data?.docs.length,
                                          itemBuilder: (context, index) {
                                            if (index == 0) {
                                              return InkWell(
                                                onTap: () {
                                                  image = null;
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Row(
                                                                //mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      right: 20,
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .camera_alt,
                                                                      size: 30,
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      pickImage(
                                                                          ImageSource
                                                                              .camera);
                                                                    },
                                                                    child: Text(
                                                                      'Camera',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 30,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  image = null;
                                                                  Navigator.pop(
                                                                      context);
                                                                  pickImage(
                                                                      ImageSource
                                                                          .gallery);
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        right:
                                                                            20,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .collections_outlined,
                                                                        size:
                                                                            30,
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () =>
                                                                          pickImage(
                                                                              ImageSource.gallery),
                                                                      child:
                                                                          Text(
                                                                        'Gallery',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      });
                                                },
                                                child: Container(
                                                  height: 150,
                                                  width: 140,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: colors.mygrey,
                                                  ),
                                                  child: Icon(Icons.add),
                                                ),
                                              );
                                            }
                                            return Container(
                                              height: 150,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Image.network(
                                                snapshot.data?.docs[index]
                                                    ["image"],
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          });
                                    }
                                    return Center(
                                        child: CircularProgressIndicator());
                                  })),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Status',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: colors.mygrey,
                  height: 30,
                  indent: 15,
                  endIndent: 15,
                ),
                FutureBuilder<List<Posts>>(
                    future: status(),
                    // FirebaseFirestore.instance.collection('/allpost').snapshots(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: CircleAvatar(
                                          maxRadius: 15,
                                          backgroundImage:
                                              AssetImage("assets/icon.png"),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(left: 10),
                                      //   child: Text(
                                      //     snapshot
                                      //         .data![index].result[index].name,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
                                      height: 250,
                                      width: 500,
                                      child: Image.network(
                                        snapshot
                                            .data![index].result[index].imgUrl,
                                        width: 500,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: IconButton(
                                            icon: Icon(
                                              selectItem.contains(
                                                snapshot.data![index]
                                                    .result[index].imgUrl,
                                              )
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: selectItem.contains(
                                                snapshot.data![index]
                                                    .result[index].imgUrl,
                                              )
                                                  ? colors.myred
                                                  : colors.myblack,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                multipleSelection(
                                                  snapshot.data![index]
                                                      .result[index].imgUrl,
                                                );
                                                isliked = !isliked;
                                              });
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text("Likes"),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/postcomments');
                                              },
                                              child: Icon(
                                                  Icons.mode_comment_outlined)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text('Comments'),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: InkWell(
                                              onTap: () async {
                                                share(
                                                  snapshot.data![index]
                                                      .result[index].imgUrl,
                                                );
                                                // final urlPreview = '';
                                                // await Share.share(
                                                //     'whatsapp://send?text=urlencodedtext');
                                              },
                                              child: Icon(
                                                  FontAwesomeIcons.whatsapp)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 100),
                                          child: InkWell(
                                              onTap: () {
                                                showModalBottomSheet<void>(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Container(
                                                        height: 150,
                                                        child: Column(
                                                          children: <Widget>[
                                                            ListTile(
                                                              title: Center(
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            '/status')
                                                                        .doc(FirebaseAuth
                                                                            .instance
                                                                            .currentUser!
                                                                            .uid)
                                                                        .collection(
                                                                            '/post')
                                                                        .get()
                                                                        .then(
                                                                            (value) {
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              '/status')
                                                                          .doc(FirebaseAuth
                                                                              .instance
                                                                              .currentUser!
                                                                              .uid)
                                                                          .collection(
                                                                              "/post")
                                                                          .doc(value
                                                                              .docs[index]
                                                                              .id)
                                                                          .delete();

                                                                      //delete all post data
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              '/allpost')
                                                                          .get()
                                                                          .then((value) => FirebaseFirestore
                                                                              .instance
                                                                              .collection('/allpost')
                                                                              .doc(value.docs[index].id)
                                                                              .delete());
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    'Delete',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            25,
                                                                        color: colors
                                                                            .gradient2pink),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            ListTile(
                                                              title: Center(
                                                                child: Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: colors
                                                                          .mygrey),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: Icon(Icons.more_horiz)),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              );
                            });
                      }
                      return Center(child: CircularProgressIndicator());
                    })),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: colors.pinkaccent,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Live()));
            },
            child: Icon(Icons.live_tv)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          height: 50,
          child: BottomAppBar(
              // elevation: 20.0,
              color: colors.mywhite54,
              shape: CircularNotchedRectangle(),
              child: Container(
                height: 75,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      iconSize: 30.0,
                      padding: EdgeInsets.only(left: 28.0),
                      icon: Icon(Icons.home),
                      onPressed: () {
                        setState(() {
                          currentIndex = 0;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()));
                        });
                      },
                    ),
                    IconButton(
                      iconSize: 30.0,
                      padding: EdgeInsets.only(right: 28.0),
                      icon: Icon(Icons.tv_rounded),
                      onPressed: () {
                        setState(() {
                          currentIndex = 1;
                          print("${currentIndex}");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Tv()));
                        });
                      },
                    ),
                    IconButton(
                      iconSize: 30.0,
                      padding: EdgeInsets.only(left: 28.0),
                      icon: Icon(Icons.message),
                      onPressed: () {
                        setState(() {
                          currentIndex = 2;
                          print("${currentIndex}");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Comments()));
                        });
                      },
                    ),
                    IconButton(
                      iconSize: 30.0,
                      padding: EdgeInsets.only(right: 28.0),
                      icon: Icon(Icons.person),
                      onPressed: () {
                        setState(() {
                          currentIndex = 3;
                          print("${currentIndex}");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfile()));
                        });
                      },
                    )
                  ],
                ),
              )),
        ));
  }

  Widget _getFloatingActionButton() {
    return SpeedDialMenuButton(
      //if needed to close the menu after clicking sub-FAB
      isShowSpeedDial: _isShowDial,
      //manually open or close menu
      updateSpeedDialStatus: (isShow) {
        //return any open or close change within the widget
        this._isShowDial = isShow;
      },
      //general init
      isMainFABMini: false,
      mainMenuFloatingActionButton: MainMenuFloatingActionButton(
          mini: false,
          child: Icon(Icons.menu),
          onPressed: () {},
          closeMenuChild: Icon(Icons.close),
          closeMenuForegroundColor: Colors.white,
          closeMenuBackgroundColor: Colors.red),
      floatingActionButtonWidgetChildren: <FloatingActionButton>[
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.volume_off),
          onPressed: () {
            //if need to close menu after click
            _isShowDial = false;
            setState(() {});
          },
          backgroundColor: Colors.pink,
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.volume_down),
          onPressed: () {
            //if need to toggle menu after click
            _isShowDial = !_isShowDial;
            setState(() {});
          },
          backgroundColor: Colors.orange,
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.volume_up),
          onPressed: () {
            //if no need to change the menu status
          },
          backgroundColor: Colors.deepPurple,
        ),
      ],
      isSpeedDialFABsMini: true,
      paddingBtwSpeedDialButton: 30.0,
    );
  }

  Widget _getBodyWidget() {
    return Container();
  }
}
