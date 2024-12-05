import 'package:flutter/material.dart';
import 'package:mtstreamapp/roomchat/channellist_page.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class RoomChat extends StatefulWidget {
  final StreamChatClient client;
  final Channel channel;

  RoomChat({Key? key, required this.client, required this.channel})
      : super(key: key);

  @override
  _RoomChatState createState() => _RoomChatState();
}

class _RoomChatState extends State<RoomChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: StreamChat(
        streamChatThemeData: StreamChatThemeData(
          colorTheme: StreamColorTheme.dark(),
          otherMessageTheme: StreamMessageThemeData(
            messageTextStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: colors.yellow,
                fontSize: 20),
          ),
          ownMessageTheme: StreamMessageThemeData(
            messageTextStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: colors.yellow,
                fontSize: 20),
            avatarTheme: StreamAvatarThemeData(
              constraints: BoxConstraints(maxWidth: 80, maxHeight: 80),
              borderRadius: BorderRadius.circular(120),
            ),
          ),
        ),
        child: ChannelListPage(widget.client, widget.channel),
        client: widget.client,
      ),
    );
  }
}
