import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class MySupport extends StatefulWidget {
  const MySupport({Key? key}) : super(key: key);

  @override
  State<MySupport> createState() => _MySupportState();
}

class _MySupportState extends State<MySupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help & Support',
          style: TextStyle(color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
    );
  }
}
