// import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class Reels extends StatefulWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Expanded(
          //   child: BetterPlayer.network(
          //     // 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          //     betterPlayerConfiguration: BetterPlayerConfiguration(
          //       autoPlay: true,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
