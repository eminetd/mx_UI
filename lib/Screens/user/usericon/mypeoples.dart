import 'package:flutter/material.dart';
import 'package:mtstreamapp/Screens/user/usericon/mypeoples/following.dart';
import 'package:mtstreamapp/Screens/user/usericon/mypeoples/history.dart';
import 'package:mtstreamapp/Screens/user/usericon/mypeoples/managed.dart';
import 'package:mtstreamapp/widgets/color.dart';

class MyPeoples extends StatefulWidget {
  const MyPeoples({Key? key}) : super(key: key);

  @override
  State<MyPeoples> createState() => _MyPeoplesState();
}

class _MyPeoplesState extends State<MyPeoples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Peoples",
          style: TextStyle(color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 25, right: 25),
                      labelColor: colors.gradient2pink,
                      labelStyle:
                          TextStyle(fontSize: 18.0, color: colors.mygrey),
                      unselectedLabelColor: colors.mygrey,
                      tabs: [
                        Tab(text: 'Following'),
                        Tab(text: 'Managed'),
                        Tab(
                          text: 'History',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      // controller: _tabController,
                      children: [
                        Following(),
                        Managed(),
                        History(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
