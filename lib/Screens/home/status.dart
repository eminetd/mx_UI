import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:mtstreamapp/model/posts.dart';
import 'package:mtstreamapp/model/tags.dart';
import 'package:mtstreamapp/service/service.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  var select;
  bool isSelected = false;
  bool isliked = false;
  String? userid = '';
  String? post_id = '2';
  HashSet<String> selectItem = HashSet();
  late SharedPreferences preferences;
  getuserid() async {
    preferences = await SharedPreferences.getInstance();
  }

  List<Tags> tags = [];
  Future<List<Tags>> tag() async {
    var url = Uri.parse(baseURL + 'all_apis.php?func=tags');
    var Param = {'func': 'tags'};
    var response = await post(url, body: Param);

    final data = json.decode(response.body);

    print(data);
    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        final dataFuture = tagsFromJson(response.body);
        dataFuture.result
            .map((e) => tags.add(Tags(count: 2, result: dataFuture.result)))
            .toList();
        print(data);
      }
    }
    return tags;
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
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    select = 'Hot';
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          color: select == 'Hot'
                              ? colors.gradient2pink
                              : colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Hot",
                          style: TextStyle(
                            fontSize: select == 'Hot' ? 20 : 17,
                            color: select == 'Hot'
                                ? colors.mywhite
                                : colors.myblack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    select = 'New';
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          color: select == 'New'
                              ? colors.gradient2pink
                              : colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "New",
                          style: TextStyle(
                            fontSize: select == 'New' ? 20 : 17,
                            color: select == 'New'
                                ? colors.mywhite
                                : colors.myblack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    select = 'Followed';
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          color: select == 'Followed'
                              ? colors.gradient2pink
                              : colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Followed",
                          style: TextStyle(
                            fontSize: select == 'Followed' ? 20 : 17,
                            color: select == 'Followed'
                                ? colors.mywhite
                                : colors.myblack,
                          ),
                        ),
                      ),
                    ),
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
                  child: Text('Trending'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 280),
                  child: Text('More >'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 200,
              child: FutureBuilder<List<Tags>>(
                  future: tag(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Column(
                                children: [
                                  Image(
                                    height: 150,
                                    image: AssetImage('assets/2stream.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data![index].result[index].name,
                                      style: TextStyle(
                                          fontSize: 20, color: colors.myblack),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              // child:
            ),
          ),
          FutureBuilder<List<Posts>>(
              future: status(),
              // FirebaseFirestore.instance.collection('/allpost').snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CircleAvatar(
                                    maxRadius: 15,
                                    backgroundImage:
                                        AssetImage("assets/icon.png"),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 10),
                                //   child: Text(
                                //     snapshot.data![index].result[index].name!,
                                //   ),
                                // ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                height: 300,
                                width: 500,
                                child: Image.network(
                                  snapshot.data![index].result[index].imgUrl,
                                  width: 500,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: IconButton(
                                      icon: Icon(
                                        selectItem.contains(
                                          snapshot.data![index].result[index]
                                              .imgUrl,
                                        )
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: selectItem.contains(
                                          snapshot.data![index].result[index]
                                              .imgUrl,
                                        )
                                            ? colors.myred
                                            : colors.myblack,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          multipleSelection(
                                            snapshot.data![index].result[index]
                                                .imgUrl,
                                          );
                                          isliked = !isliked;
                                        });
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Likes"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/postcomments');
                                        },
                                        child:
                                            Icon(Icons.mode_comment_outlined)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text('Comments'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: InkWell(
                                        onTap: () async {
                                          // share();
                                          // final urlPreview = '';
                                          // await Share.share(
                                          //     'whatsapp://send?text=urlencodedtext');
                                        },
                                        child: Icon(FontAwesomeIcons.whatsapp)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100),
                                    child: Icon(Icons.more_horiz),
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
    ));
  }
}



//
