import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Mybag extends StatefulWidget {
  const Mybag({Key? key}) : super(key: key);

  @override
  State<Mybag> createState() => _MybagState();
}

class _MybagState extends State<Mybag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Bag',
          style: TextStyle(color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
    );
  }
}
