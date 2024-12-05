import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mtstreamapp/Screens/home/profile.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Profiles extends StatefulWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('/Usernames').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Profile(
                        proimage: snapshot.data?.docs[index]['pimage'],
                        uname: snapshot.data?.docs[index]['username'],
                      );
                    }));
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
                                    child: Image.network(
                                        snapshot.data?.docs[index]['pimage']),
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 110),
                              child: Text(
                                snapshot.data?.docs[index]['username'],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, left: 100),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      height: 20,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: colors.myred,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              'Lv 11',
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
                                    padding: const EdgeInsets.only(left: 10),
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
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Icon(
                                              Icons.favorite,
                                              color: colors.myred,
                                              size: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              '111',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: colors.myblack),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Last Online :"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
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
        },
      ),
    );
  }
}
