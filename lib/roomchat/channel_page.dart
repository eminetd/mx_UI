import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

class ChannelPage extends StatefulWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.myblack,
      //appBar: StreamChannelHeader(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 350,
            //   child: Column(
            //     children: [],
            //   ),
            // ),
            Expanded(
                child: StreamMessageListView(
              showFloatingDateDivider: true,
              highlightInitialMessage: true,
              showConnectionStateTile: true,
              showScrollToBottom: true,
              messageBuilder: (context, msg, List<Message> id, _) {
                return ListTile(
                  // leading: Text('${auth.currentUser?.displayName}'),
                  title: Text(
                    msg.message.text.toString(),
                    style: TextStyle(color: colors.yellow),
                  ),
                );
              },
              spacingWidgetBuilder: (context, list) {
                return Text("");
              },
              onMessageSwiped: (message) {},
              messageHighlightColor: colors.indigo,
            )),
            StreamMessageInput(),
          ],
        ),
      ),
    );
  }
}
