import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mtstreamapp/model/partymodel.dart';
import 'package:mtstreamapp/service/service.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Party extends StatefulWidget {
  const Party({Key? key}) : super(key: key);

  @override
  State<Party> createState() => _PartyState();
}

class _PartyState extends State<Party> {
  List<PartyModel> party = [];
  Future<List<PartyModel>> parties() async {
    var url = Uri.parse(baseURL + 'all_apis.php?func=party');
    var Param = {'func': 'party'};
    var response = await post(url, body: Param);
    final data = json.decode(response.body);

    print(data);
    if (response.statusCode == 200) {
      final dataFuture = partyModelFromJson(response.body);
      dataFuture.result
          .map((e) => party.add(PartyModel(result: dataFuture.result)))
          .toList();
      print(data);
    }
    return party;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //listview.builder
          Expanded(
            child: FutureBuilder<List<PartyModel>>(
              future: parties(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shadowColor: Colors.blueGrey,
                          child: Container(
                            height: 120,
                            color: colors.mywhite,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                    snapshot.data![index].result[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset("assets/gift.png"),
                                        Text(
                                          snapshot
                                              .data![index].result[index].pname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Container(
                                            height: 20,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                colors.gradient1purple,
                                                colors.gradient2pink,
                                                colors.orange,
                                                colors.lightgreen,
                                                colors.gradient1purple
                                              ]),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                    "assets/crown1.png"),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Text(
                                                    'Together Forever',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: colors.mywhite),
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
                                            width: 100,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                colors.lightgreen,
                                                colors.gradient1purple
                                              ]),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: colors.mycyan,
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                    "assets/crown1.png"),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Text(
                                                    'Super Star',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: colors.mywhite),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 110, top: 20),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                snapshot.data![index]
                                                    .result[index].pname,
                                                style: TextStyle(
                                                    color: colors.mygrey,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            // child:
          ),
        ],
      ),
    );
  }
}
