import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtstreamapp/Screens/home/ranking.dart';
import 'package:mtstreamapp/Screens/home/squad_task.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Sqaud extends StatefulWidget {
  const Sqaud({Key? key}) : super(key: key);

  @override
  State<Sqaud> createState() => _SqaudState();
}

class _SqaudState extends State<Sqaud> {
  var select;
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
                    select = 'Popular';
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          color: select == 'Popular'
                              ? colors.gradient2pink
                              : colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Popular",
                          style: TextStyle(
                            fontSize: select == 'Popular' ? 20 : 17,
                            color: select == 'Popular'
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
                    select = 'My Squad';
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: select == 'My Squad'
                              ? colors.gradient2pink
                              : colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "My Squad",
                          style: TextStyle(
                            fontSize: select == 'My Squad' ? 20 : 17,
                            color: select == 'My Squad'
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
                    select = 'Rank';
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          color: select == 'Rank'
                              ? colors.gradient2pink
                              : colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Rank",
                          style: TextStyle(
                            fontSize: select == 'Rank' ? 20 : 17,
                            color: select == 'Rank'
                                ? colors.mywhite
                                : colors.myblack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Icon(
                    Icons.add_circle_outline,
                    color: colors.mygrey,
                  ),
                )
              ],
            ),
          ),
          select == 'Popular'
              ? Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Card(
                            shadowColor: Colors.blueGrey,
                            child: Container(
                              height: 100,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: colors.transparent,
                                      maxRadius: 40.0,
                                      child: ClipRRect(
                                        child:
                                            Image.asset('assets/3stream.jpg'),
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 90),
                                    child: Text(
                                      "User Name",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 90),
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
                                              Icons.person,
                                              size: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              '21',
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
                                    padding:
                                        const EdgeInsets.only(top: 50, left: 9),
                                    child: Container(
                                      height: 20,
                                      width: 60,
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
                                              'Activate',
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
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 150),
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
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Icon(
                                              FontAwesomeIcons.rankingStar,
                                              size: 18,
                                              color: colors.mywhite,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              '20',
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
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 210),
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
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: colors.mywhite),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 330),
                                    child: Container(
                                      height: 40,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: colors.gradient2pink,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Join',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: colors.mywhite),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 70, left: 90),
                                    child: Text('Messages'),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                )
              : Container(),
          select == 'My Squad'
              ? DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: TabBar(
                          isScrollable: true,
                          labelPadding:
                              const EdgeInsets.only(left: 65, right: 65),
                          // controller: _tabController,
                          labelColor: colors.mygrey,
                          unselectedLabelStyle:
                              TextStyle(fontSize: 20.0, color: colors.myblack),
                          labelStyle:
                              TextStyle(fontSize: 20.0, color: colors.mygrey),
                          unselectedLabelColor: colors.mygrey,
                          tabs: [
                            Tab(text: 'Squad  tasks'),
                            Tab(text: 'Ranking'),
                          ],
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height,
                        child: TabBarView(
                          // controller: _tabController,
                          children: [
                            SquadTask(),
                            Ranking(),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          select == 'Rank'
              ? Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Card(
                            shadowColor: Colors.blueGrey,
                            child: Container(
                              height: 100,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 20),
                                    child: Image.asset('assets/crown1.png'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 60),
                                    child: CircleAvatar(
                                        backgroundColor: colors.transparent,
                                        maxRadius: 40.0,
                                        child: ClipRRect(
                                          child:
                                              Image.asset('assets/3stream.jpg'),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, left: 150),
                                    child: Text(
                                      "User Name",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 150),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
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
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Icon(
                                                  Icons.person,
                                                  size: 18,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  '21',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: colors.myblack),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: colors.myred,
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  'Active',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: colors.mywhite),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: colors.gradient2pink,
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Icon(
                                                  FontAwesomeIcons.rankingStar,
                                                  size: 18,
                                                  color: colors.mywhite,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  '20',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: colors.mywhite),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: colors.gradient1purple,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Love',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: colors.mywhite),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 70, left: 150),
                                    child: Row(
                                      children: [
                                        Text('Messages'),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 140),
                                          child: Text('Points'),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    ));
  }
}
