import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mtstreamapp/model/gifts.dart';
import 'package:mtstreamapp/service/service.dart';
import 'package:mtstreamapp/widgets/color.dart';

class GiftsPage extends StatefulWidget {
  const GiftsPage({Key? key}) : super(key: key);

  @override
  State<GiftsPage> createState() => _GiftsPageState();
}

class _GiftsPageState extends State<GiftsPage> {
  List<Gifts> gifts = [];
  Future<List<Gifts>> gift() async {
    var url = Uri.parse(baseURL + 'all_apis.php?func=gifts');
    var Param = {'func': 'gifts'};
    var response = await post(url, body: Param);
    final data = json.decode(response.body);

    print(data);
    if (response.statusCode == 200) {
      final dataFuture = giftsFromJson(response.body);
      dataFuture.result
          .map((e) => gifts.add(Gifts(count: 3, result: dataFuture.result)))
          .toList();
      print(data);
    }
    return gifts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Gifts>>(
                future: gift(),
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
                                                .img),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 110),
                                      child: Text(
                                        snapshot
                                            .data![index].result[index].name,
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
