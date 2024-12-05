// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mtstreamapp/Screens/home/homepage.dart';
import 'package:mtstreamapp/Screens/home/live_page.dart';
import 'package:mtstreamapp/Screens/home/tv_page.dart';
import 'package:mtstreamapp/Screens/user/user.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
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
    return Scaffold(
        //Appbar
        appBar: AppBar(
          title: Row(
            children: [
              Text('Inbox'),
              Padding(
                padding: const EdgeInsets.only(left: 220),
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/friends');
                    },
                    child: Icon(Icons.people)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/inbox');
                    },
                    child: Icon(Icons.settings)),
              ),
            ],
          ),
          backgroundColor: Color(0xffFE3434),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Image(
                  image: AssetImage('assets/bell.png'),
                ),
                title: Text(
                  "New Notices",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Image(
                image: AssetImage('assets/bell.png'),
              ),
              title: Text(
                "System Notices",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Divider(),
            ListTile(
              leading: Image(
                image: AssetImage('assets/bell.png'),
              ),
              title: Text(
                "SK Play Assist",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Divider(),
            ListTile(
              leading: Image(
                image: AssetImage('assets/bell.png'),
              ),
              title: Text(
                "Talent Assistant",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            // Expanded(
            //   //Listviewbuilder
            //   child: ListView.builder(
            //       itemCount: 10,
            //       itemBuilder: (context, index) => Padding(
            //             padding: const EdgeInsets.only(top: 20),
            //             child: Container(
            //               height: 100,
            //               color: colors.mywhite,
            //               child: Row(
            //                 children: [
            //                   SizedBox(
            //                     height: 100,
            //                     width: 90,
            //                     child: Image(
            //                       image: AssetImage('assets/bell.png'),
            //                     ),
            //                   ),
            //                   Column(
            //                     children: [
            //                       Padding(
            //                         padding: const EdgeInsets.only(top: 20),
            //                         child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               "Top Master Brand",
            //                               style: TextStyle(
            //                                   fontWeight: FontWeight.bold,
            //                                   fontSize: 20),
            //                             ),
            //                             Padding(
            //                               padding:
            //                                   const EdgeInsets.only(left: 120),
            //                               child: CircleAvatar(
            //                                 maxRadius: 10,
            //                                 backgroundColor: Color(0xffFE3434),
            //                                 child: Text('2'),
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                       Padding(
            //                         padding: const EdgeInsets.only(top: 40),
            //                         child: Row(
            //                           children: [
            //                             Text(
            //                               'Private message',
            //                               style: TextStyle(
            //                                   color: colors.mygrey,
            //                                   fontSize: 16),
            //                             ),
            //                             Padding(
            //                               padding:
            //                                   const EdgeInsets.only(left: 120),
            //                               child: Text('4'),
            //                             ),
            //                             Padding(
            //                               padding:
            //                                   const EdgeInsets.only(left: 10),
            //                               child: Text('Hour(s) ago'),
            //                             )
            //                           ],
            //                         ),
            //                       )
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           )),
            // ),
          ],
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
}
