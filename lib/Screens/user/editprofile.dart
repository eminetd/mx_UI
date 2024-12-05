import 'dart:convert';
import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:mtstreamapp/Screens/user/user.dart';
import 'package:mtstreamapp/service/service.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  var isselected;
  String? gender = 'male';
  String userid = '';
  TextEditingController namecontroller = TextEditingController();
  TextEditingController introcontroller = TextEditingController();

  File? image = null;
  FirebaseAuth auth = FirebaseAuth.instance;
  SharedPreferences? prefs;
  Future pickImage(ImageSource source) async {
    try {
      final Image = await ImagePicker().pickImage(source: source);
      if (Image == null) return;

      image = File(Image.path);
      // final imagePermanent = await saveImagePermanent(image!.path);
      setState(() {});
    } on PlatformException catch (e) {
      print('failed to pick image:$e');
    }
  }

  @override
  void initState() {
    setState(() {
      userdetails('37');
      // FirebaseFirestore.instance
      //     .collection('/${auth.currentUser?.uid}')
      //     .doc()
      //     .get()
      //     .then((value) {
      //   setState(() {
      //     namecontroller.text = value['Username'];
      //   });
      // });
    });
    super.initState();
  }

  DateTime _datetime = DateTime.now();
  _showDatePicker() async {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _datetime = value!;
      });
    });
  }

  userdetails(String userID) async {
    var url = Uri.parse(baseURL + 'all_apis.php?func=user_details_from_userid');
    var Param = {
      'userid': userID,
    };
    print(userID);
    var response = await post(url, body: Param);
    final data = json.decode(response.body);

    print(data);

    if (response.statusCode == 200) {
      if (data['message'] == 'user found') {
        print('success');
        print(data['result']['USERID']);
        userid = data['result']['USERID'];
        print(userid);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String _formatdate = DateFormat.yMMMd().format(_datetime);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.whitegrey,
        title: Row(
          children: [
            Text(
              "Edit Profile",
              style: TextStyle(color: colors.myblack),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180),
              child: InkWell(
                onTap: () {
                  FirebaseStorage.instance
                      .ref()
                      .child("/profile")
                      .putFile(File(image!.path));
                  FirebaseStorage.instance
                      .ref("/")
                      .child("/profile")
                      .getDownloadURL()
                      .then((url) {
                    FirebaseFirestore.instance
                        .collection('/Dp')
                        .doc("text")
                        .set({
                      'imageurl': url,
                    });
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserProfile()));
                },
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: colors.myblack),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Choose From'),

                              Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      pickImage(ImageSource.camera);
                                    },
                                    child: Text(
                                      'Camera',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  image = null;
                                  Navigator.pop(context);
                                  pickImage(ImageSource.gallery);
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20,
                                      ),
                                      child: Icon(
                                        Icons.collections_outlined,
                                        size: 30,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          pickImage(ImageSource.gallery),
                                      child: Text(
                                        'Gallery',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Icon(
                                      Icons.cancel,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    'Cancel',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              // ElevatedButton(
                              //   child: const Text('Close BottomSheet'),
                              //   onPressed: () => Navigator.pop(context),
                              // )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                      backgroundColor: colors.transparent,
                      child: image != null
                          ? ClipOval(
                              child: Image.file(
                                image!,
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.network(FirebaseAuth
                              .instance.currentUser!.photoURL
                              .toString())),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Nickname",
                    style: TextStyle(color: colors.mygrey),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Change Nick name"),
                          content: Container(
                            height: 100,
                            width: 250,
                            child: TextFormField(
                              controller: namecontroller,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Nickname',
                              ),
                            ),
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(left: 180),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: colors.mygrey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: InkWell(
                                      onTap: () {
                                        FirebaseFirestore.instance
                                            .collection(
                                                '/${auth.currentUser!.uid}')
                                            .doc("test")
                                            .set({
                                          'Username': namecontroller.text,
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: InkWell(
                                        onTap: () {
                                          namecontroller.text;
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                              color: colors.gradient2pink),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        FirebaseAuth.instance.currentUser!.displayName
                            .toString(),
                        style: TextStyle(color: colors.myblack, fontSize: 20),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Id",
                      style: TextStyle(color: colors.mygrey),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      '${userid}',
                      style: TextStyle(color: colors.myblack, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        FlutterClipboard.copy('${userid}').then(
                            (value) => Fluttertoast.showToast(msg: 'Copied'));
                      },
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          color: colors.pinkaccent,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'Copy',
                                style: TextStyle(
                                    fontSize: 15, color: colors.mywhite),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Region",
                      style: TextStyle(color: colors.mygrey),
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
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "India",
                      style: TextStyle(color: colors.myblack, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Gender",
                      style: TextStyle(color: colors.mygrey),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text("Gender"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RadioListTile(
                                    value: "Male",
                                    title: Text("Male"),
                                    groupValue: isselected,
                                    onChanged: (value) {
                                      setState(() {
                                        isselected = value;
                                        gender = value.toString();
                                        print(isselected);
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    value: "Female",
                                    title: Text("FeMale"),
                                    groupValue: isselected,
                                    onChanged: (value) {
                                      setState(() {
                                        isselected = value;
                                        gender = value.toString();
                                        print(isselected);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      });
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        gender.toString(),
                        style: TextStyle(color: colors.myblack, fontSize: 20),
                      ),
                    ),
                    // Padding(
                    //     padding: const EdgeInsets.only(left: 0),
                    //     child: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Birthday",
                      style: TextStyle(color: colors.mygrey),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _showDatePicker();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(_formatdate.toString()),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Introduction",
                      style: TextStyle(color: colors.mygrey),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Introduction"),
                        content: Container(
                          height: 100,
                          width: 250,
                          child: TextFormField(
                            controller: introcontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Introduction',
                            ),
                          ),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(left: 180),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: colors.mygrey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: InkWell(
                                    onTap: () {
                                      FirebaseFirestore.instance
                                          .collection('/Introduction')
                                          .doc("Intro")
                                          .set({
                                        'Introduction': introcontroller.text,
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: InkWell(
                                      onTap: () {
                                        introcontroller.text;
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            color: colors.gradient2pink),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(introcontroller.text),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
