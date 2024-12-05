import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class MyLevel extends StatefulWidget {
  const MyLevel({Key? key}) : super(key: key);

  @override
  State<MyLevel> createState() => _MyLevelState();
}

class _MyLevelState extends State<MyLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Level',
          style: TextStyle(color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
