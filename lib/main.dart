// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtstreamapp/Screens/home/friendslist.dart';
import 'package:mtstreamapp/Screens/home/homepage.dart';
import 'package:mtstreamapp/Screens/home/inbox.dart';
import 'package:mtstreamapp/Screens/home/popular.dart';
import 'package:mtstreamapp/Screens/home/profile.dart';
import 'package:mtstreamapp/Screens/home/reel.dart';
import 'package:mtstreamapp/Screens/home/room_chat.dart';
import 'package:mtstreamapp/Screens/home/search.dart';
import 'package:mtstreamapp/Screens/home/top_users.dart';
import 'package:mtstreamapp/Screens/home/toplist.dart';
import 'package:mtstreamapp/Screens/login/login.dart';
import 'package:mtstreamapp/Screens/login/phonelogin.dart';
import 'package:mtstreamapp/Screens/login/splashcreen.dart';
import 'package:mtstreamapp/Screens/user/accinfo.dart';
import 'package:mtstreamapp/Screens/user/add_status.dart';
import 'package:mtstreamapp/Screens/user/bean%20Payment/payment.dart';
import 'package:mtstreamapp/Screens/user/editprofile.dart';
import 'package:mtstreamapp/Screens/user/gifts.dart';
import 'package:mtstreamapp/Screens/user/post_topic.dart';
import 'package:mtstreamapp/Screens/user/postcomments.dart';
import 'package:mtstreamapp/Screens/user/setttings.dart';
import 'package:mtstreamapp/Screens/user/usericon/earnings.dart';
import 'package:mtstreamapp/Screens/user/usericon/earnings/officialtalent.dart';
import 'package:mtstreamapp/Screens/user/usericon/help_support.dart';
import 'package:mtstreamapp/Screens/user/usericon/mybadge.dart';
import 'package:mtstreamapp/Screens/user/usericon/mybag.dart';
import 'package:mtstreamapp/Screens/user/usericon/myinvites.dart';
import 'package:mtstreamapp/Screens/user/usericon/mylevel.dart';
import 'package:mtstreamapp/Screens/user/usericon/mypeoples.dart';
import 'package:mtstreamapp/Screens/user/usericon/mytask.dart';
import 'package:mtstreamapp/Screens/user/usericon/shop.dart';
import 'package:mtstreamapp/Screens/user/usericon/topup.dart';
import 'package:mtstreamapp/Screens/user/usericon/user_room_mang.dart';
import 'package:mtstreamapp/Screens/user/usericon/vip.dart';
import 'package:mtstreamapp/roomchat/streamapi.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'roomchat/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final client = StreamChatClient(Config.apiKey, logLevel: Level.SEVERE);

  await StreamApi.initUser(
    client,
    username: '${FirebaseAuth.instance.currentUser?.displayName}',
    urlImage: '${FirebaseAuth.instance.currentUser?.photoURL}',
    id: Config.idEmily,
    token: Config.tokenEmily,
  );
  final channel =
      await StreamApi.watchChannel(client, type: 'messaging', id: 'sample');

  runApp(MyApp(client: client, channel: channel));
}

class MyApp extends StatelessWidget {
  late StreamChatClient? client;
  late Channel? channel;
  MyApp({Key? key, this.client, this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Dil Do',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme)),
        routes: {
          '/home': (context) => Homepage(),
          '/phonelogin': (context) => PhoneLogin(),
          '/popular': (context) => Popular(),
          '/friends': (context) => FriendsList(),
          '/inbox': (context) => Inbox(),
          '/accinfo': (context) => AccountInfo(),
          '/profile': (context) => Profile(),
          '/toplist': (context) => TopList(),
          '/settings': (context) => Settings(),
          '/topup': (context) => TopUP(),
          '/editprofile': (context) => Editprofile(),
          '/postcomments': (context) => PostComments(),
          '/shop': (context) => Shop(),
          '/mytask': (context) => MyTask(),
          '/mybag': (context) => Mybag(),
          '/mylevel': (context) => MyLevel(),
          '/mybadge': (context) => MyBadge(),
          '/support': (context) => MySupport(),
          '/vip': (context) => Vip(),
          '/mypeople': (context) => MyPeoples(),
          '/earnings': (context) => Earnings(),
          '/myroom': (context) => MyManagement(),
          '/topusers': (context) => TopUsers(),
          '/myinvite': (context) => MyInvite(),
          '/pay': (context) => Payment(),
          '/talent': (context) => OfficialTalent(),
          '/topic': (context) => Topic(),
          '/reel': (context) => Reels(),
          '/search': (context) => Profiles(),
          '/gifts': (context) => GiftsPage(),
          '/roomchat': (context) =>
              RoomChat(channel: channel!, client: client!),
        },
        home: LoginPage(),
      ),
    );
  }
}
