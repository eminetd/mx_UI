import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/call.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:permission_handler/permission_handler.dart';

class Live extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LiveState();
}

class LiveState extends State<Live> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole? _role = ClientRole.Broadcaster;
  @override
  void initState() {
    onJoin();
    super.initState();
  }

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.mywhite,

      // body: Center(
      //   child: Container(
      //     padding: const EdgeInsets.symmetric(horizontal: 20),
      //     height: 400,
      //     child: Column(
      //       children: <Widget>[
      //         Row(
      //           children: <Widget>[
      //             Expanded(
      //                 child: TextField(
      //               controller: _channelController,
      //               decoration: InputDecoration(
      //                 // errorText:
      //                 //     _validateError ? 'Channel name is mandatory' : null,
      //                 border: UnderlineInputBorder(
      //                   borderSide: BorderSide(width: 1),
      //                 ),
      //                 hintText: 'Channel name',
      //               ),
      //             ))
      //           ],
      //         ),
      //         Column(
      //           children: [
      //             ListTile(
      //               title: Text(ClientRole.Broadcaster.toString()),
      //               leading: Radio(
      //                 value: ClientRole.Broadcaster,
      //                 groupValue: _role,
      //                 onChanged: (ClientRole? value) {
      //                   setState(() {
      //                     _role = value;
      //                   });
      //                 },
      //               ),
      //             ),
      //             ListTile(
      //               title: Text(ClientRole.Audience.toString()),
      //               leading: Radio(
      //                 value: ClientRole.Audience,
      //                 groupValue: _role,
      //                 onChanged: (ClientRole? value) {
      //                   setState(() {
      //                     _role = value;
      //                   });
      //                 },
      //               ),
      //             )
      //           ],
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(vertical: 20),
      //           child: Row(
      //             children: <Widget>[
      //               Expanded(
      //                 child: ElevatedButton(
      //                   onPressed: onJoin,
      //                   child: Text('Join'),
      //                   style: ButtonStyle(
      //                       backgroundColor: MaterialStateProperty.all(
      //                           colors.gradient1purple),
      //                       foregroundColor:
      //                           MaterialStateProperty.all(colors.mywhite)),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    // setState(() {
    //   _channelController.text.isEmpty
    //       ? _validateError = true
    //       : _validateError = false;
    // });

    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    // push video page with given channel name
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
          channelName: "test",
          role: ClientRole.Broadcaster,
        ),
      ),
    );
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
