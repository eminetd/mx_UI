import 'package:flutter/material.dart';
import 'package:mtstreamapp/Screens/user/usericon/mytask/dailytask.dart';
import 'package:mtstreamapp/Screens/user/usericon/mytask/innamghar.dart';
import 'package:mtstreamapp/widgets/color.dart';

class MyTask extends StatefulWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.mywhite,
        title: Text(
          'My Task',
          style: TextStyle(color: colors.myblack),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 25, right: 25),
                      labelColor: colors.gradient2pink,
                      labelStyle:
                          TextStyle(fontSize: 18.0, color: colors.mygrey),
                      unselectedLabelColor: colors.mygrey,
                      tabs: [
                        Tab(text: 'Daily Task'),
                        Tab(text: 'Innam ghar'),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      // controller: _tabController,
                      children: [
                        DailyTask(),
                        Inamghar(),
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
