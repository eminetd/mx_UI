import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class MyBadge extends StatefulWidget {
  const MyBadge({Key? key}) : super(key: key);

  @override
  State<MyBadge> createState() => _MyBadgeState();
}

class _MyBadgeState extends State<MyBadge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Badge',
          style: TextStyle(color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
    );
  }
}
