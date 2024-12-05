import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mtstreamapp/model/top_users.dart';
import 'package:mtstreamapp/service/service.dart';
import 'package:mtstreamapp/widgets/color.dart';

class TopUsers extends StatefulWidget {
  const TopUsers({Key? key}) : super(key: key);

  @override
  State<TopUsers> createState() => _TopUsersState();
}

class _TopUsersState extends State<TopUsers> {
  List? listresponse;
  Map? mapresponse;
  List<Topusers> topuser = [];
  Future<List<Topusers>> topusers() async {
    var url = Uri.parse(baseURL + 'all_apis.php?func=top_users');
    var Param = {'func': 'top_users'};
    var response = await post(url, body: Param);
    final data = json.decode(response.body);

    print(data);
    if (response.statusCode == 200) {
      final dataFuture = topusersFromJson(response.body);
      dataFuture.result
          .map(
              (e) => topuser.add(Topusers(count: 2, result: dataFuture.result)))
          .toList();
      print(data);
    }
    return topuser;
  }

  // if (response.statusCode == 200) {
  //   mapresponse = json.decode(response.body);
  //   print(mapresponse);

  //   print('fail');

  //   setState(() {
  //     listresponse = mapresponse!['data'];
  //   });
  // } else {
  //   print('fail');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 350,
            width: 500,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              colors.myblue,
              colors.gradient1purple,
              colors.myred,
              // colors.pinkaccent,
            ])),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Text(
                    "Top Users",
                    style: TextStyle(color: colors.mywhite, fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: colors.mywhite2,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text('Daily'),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: colors.mywhite2,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text('7 Days'),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: colors.mywhite2,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text('30 Days'),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: colors.mywhite2,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text('Total'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200, left: 30),
                  child: Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                      color: colors.mywhite,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 190),
                  child: Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                      color: colors.mywhite,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200, left: 350),
                  child: Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                      color: colors.mywhite,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Topusers>>(
                future: topusers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                          child: Card(
                              shadowColor: Colors.blueGrey,
                              child: Container(
                                height: 80,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: CircleAvatar(
                                          backgroundColor: colors.transparent,
                                          maxRadius: 40.0,
                                          child: ClipRRect(
                                            child: Image.network(snapshot
                                                .data![index]
                                                .result[index]
                                                .PROFILE_PIC),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 110),
                                      child: Text(
                                        snapshot
                                            .data![index].result[index].NAME,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 100),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Container(
                                              height: 20,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: colors.myred,
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text(
                                                      'Lv 11',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color:
                                                              colors.mywhite),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Container(
                                              height: 20,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: colors.yellow,
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Icon(
                                                      Icons.favorite,
                                                      color: colors.myred,
                                                      size: 18,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text(
                                                      '111',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color:
                                                              colors.myblack),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text("Last Online :"),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text("10 days ago"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }
}
