import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Likes extends StatefulWidget {
  const Likes({Key? key}) : super(key: key);

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Likes "),
        backgroundColor: colors.mywhite,
      ),
      body: Column(
        children: [
          ListView.builder(itemBuilder: (BuildContext context, int index) {
            return Container();
          })
        ],
      ),
    );
  }
}
