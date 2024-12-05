import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({Key? key}) : super(key: key);

  @override
  State<FriendsList> createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Apppbar
      appBar: AppBar(
        title: Text(
          "Friends List",
          style: TextStyle(fontSize: 25, color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            "No Data",
            style: TextStyle(fontSize: 20, color: colors.mygrey),
          ))
        ],
      ),
    );
  }
}
