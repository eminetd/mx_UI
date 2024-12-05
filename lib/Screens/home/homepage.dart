import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtstreamapp/Screens/home/freshers.dart';
import 'package:mtstreamapp/Screens/home/live_page.dart';
import 'package:mtstreamapp/Screens/home/party.dart';
import 'package:mtstreamapp/Screens/home/pkmatches.dart';
import 'package:mtstreamapp/Screens/home/popular.dart';
import 'package:mtstreamapp/Screens/home/spotlight.dart';
import 'package:mtstreamapp/Screens/home/tv_page.dart';
import 'package:mtstreamapp/Screens/user/comments.dart';
import 'package:mtstreamapp/Screens/user/user.dart';
import 'package:mtstreamapp/main.dart';
import 'package:mtstreamapp/widgets/color.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 2;
  bool isSelected = false;
  List<Widget> pages = [Homepage(), Tv(), Live(), Comments(), UserProfile()];

  int currentIndex = 0;

  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // PersistentTabController _controller =
  //     PersistentTabController(initialIndex: 0);
  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.home),
  //       // title: ("Home"),
  //       activeColorPrimary: colors.pinkaccent,
  //       inactiveColorPrimary: colors.myblack,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.tv_circle),
  //       // title: ("Tv"),
  //       activeColorPrimary: colors.pinkaccent,
  //       inactiveColorPrimary: colors.myblack,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(
  //         CupertinoIcons.camera_circle_fill,
  //         color: colors.mywhite,
  //       ),
  //       // title: ("Live"),
  //       activeColorPrimary: colors.pinkaccent,
  //       inactiveColorPrimary: colors.myblack,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.mail_solid),
  //       // title: ("Notification"),
  //       activeColorPrimary: colors.pinkaccent,
  //       inactiveColorPrimary: colors.myblack,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.profile_circled),
  //       // title: ("User"),
  //       activeColorPrimary: colors.pinkaccent,
  //       inactiveColorPrimary: colors.myblack,
  //     ),
  //   ];
  // }

  // TabController _tabController = TabController(length: 5, vsync: this);
  @override
  Widget build(BuildContext context) {
    // TabController _tabController = TabController(length: 5, vsync: this);

    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    colors.gradient1purple,
                    colors.pinkaccent,
                    colors.pinkaccent,
                  ])),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 300,
                          //Tabbar
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
                            unselectedLabelColor: colors.mywhite,
                            tabs: [
                              Tab(text: 'Freshers'),
                              Tab(text: 'Popular'),
                              Tab(
                                text: 'Spotlight',
                              ),
                              Tab(
                                text: 'Party',
                              ),
                              Tab(
                                text: 'Pkmatches',
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/search');
                          },
                          child: Icon(
                            FontAwesomeIcons.searchengin,
                            color: colors.mywhite,
                            size: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/toplist');
                            },
                            child: Icon(
                              Icons.military_tech,
                              color: colors.mywhite,
                              size: 25,
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
                      Freshers(),
                      Popular(),
                      Spotlight(),
                      Party(),
                      PKmatches(),
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
          )

          // bottom navigation bar
          ),
    );
  }
}

// PersistentTabView(
//           context,
//           controller: _controller,
//           screens: pages,
//           items: _navBarsItems(),
//           confineInSafeArea: true,
//           backgroundColor: colors.transparent, // Default is Colors.white.
//           handleAndroidBackButtonPress: true, // Default is true.
//           resizeToAvoidBottomInset:
//               true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//           stateManagement: true, // Default is true.
//           hideNavigationBarWhenKeyboardShows:
//               true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//           decoration: NavBarDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//             colorBehindNavBar: Colors.white,
//           ),
//           popAllScreensOnTapOfSelectedTab: true,
//           popActionScreens: PopActionScreensType.all,
//           itemAnimationProperties: ItemAnimationProperties(
//             // Navigation Bar's items animation properties.
//             duration: Duration(milliseconds: 200),
//             curve: Curves.ease,
//           ),
//           screenTransitionAnimation: ScreenTransitionAnimation(
//             // Screen transition animation on change of selected tab.
//             animateTabTransition: true,
//             curve: Curves.ease,
//             duration: Duration(milliseconds: 200),
//           ),
//           navBarStyle: NavBarStyle
//               .style15, // Choose the nav bar style with this property.
//         ),

// appBar: AppBar(
//             backgroundColor: Color(0xFFfe4a97),
//             elevation: 0.0,
//             flexibleSpace: TabBar(
//               isScrollable: true,
//               tabs: [
//                 Tab(text: 'Freshers'),
//                 Tab(text: 'popular'),
//                 Tab(text: 'spotlight'),
//                 Tab(text: 'party'),
//                 Tab(text: 'PK matches')
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               Freshers(),
//               Popular(),
//               Spotlight(),
//               Party(),
//               PKmatches(),
//             ],
//           ),
