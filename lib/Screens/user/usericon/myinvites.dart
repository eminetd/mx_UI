import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class MyInvite extends StatefulWidget {
  const MyInvite({Key? key}) : super(key: key);

  @override
  State<MyInvite> createState() => _MyInviteState();
}

class _MyInviteState extends State<MyInvite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invites',
          style: TextStyle(color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
    );
  }
}
