import 'package:flutter/material.dart';
import 'package:mtstreamapp/Screens/home/homepage.dart';
import 'package:mtstreamapp/Screens/home/live_page.dart';
import 'package:mtstreamapp/Screens/home/squad.dart';
import 'package:mtstreamapp/Screens/home/status.dart';
import 'package:mtstreamapp/Screens/user/comments.dart';
import 'package:mtstreamapp/Screens/user/user.dart';
import 'package:mtstreamapp/widgets/color.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

class Tv extends StatefulWidget {
  const Tv({Key? key}) : super(key: key);

  @override
  State<Tv> createState() => _TvState();
}

class _TvState extends State<Tv> {
  int index = 2;
  bool isSelected = false;
  List<Widget> pages = [Homepage(), Tv(), Live(), Comments(), UserProfile()];

  int currentIndex = 0;

  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    colors.gradient1purple,
                    colors.gradient1purple,
                    colors.gradient2pink,
                  ])),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        Container(
                          child: Container(
                            height: 50,
                            width: 300,
                            child: TabBar(
                              isScrollable: true,
                              labelPadding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              // controller: _tabController,
                              labelColor: colors.mywhite,
                              unselectedLabelStyle: TextStyle(
                                  fontSize: 20.0, color: colors.mywhite),
                              labelStyle: TextStyle(
                                  fontSize: 30.0, color: colors.myblack2),
                              unselectedLabelColor: colors.mywhite2,
                              tabs: [
                                Tab(text: 'Status'),
                                Tab(text: 'Squad'),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    // controller: _tabController,
                    children: [
                      Status(),
                      Sqaud(),
                    ],
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: colors.pinkaccent,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Live()));
              },
              child: Icon(Icons.live_tv)),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
          )),
    );
  }
}
