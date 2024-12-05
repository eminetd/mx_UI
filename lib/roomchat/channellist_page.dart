import 'package:flutter/material.dart';
import 'package:mtstreamapp/roomchat/channel_page.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelListPage extends StatefulWidget {
  final StreamChatClient client;
  final Channel channel;
  ChannelListPage(this.client, this.channel);
  @override
  State<ChannelListPage> createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  late StreamChannelListController controller;
  @override
  void initState() {
    controller = StreamChannelListController(client: widget.client);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print('Own id: ${StreamChat.of(context).currentUser!.id}');
    return Scaffold(
      body: StreamChannel(
        channel: widget.channel,
        child: ChannelPage(),
      ),
    );
  }
}
