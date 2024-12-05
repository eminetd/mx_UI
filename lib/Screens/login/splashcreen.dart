import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mtstreamapp/Screens/home/homepage.dart';
import 'package:mtstreamapp/Screens/login/login.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:mtstreamapp/widgets/pallete.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final user = auth.currentUser;

    if (user != null) {
      Timer(
          Duration(seconds: 1),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.myblack,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image(
            //     height: 300,
            //     width: 550,
            //     image: AssetImage('assets/5stream.jpg')),
            Container(
              height: 150,
              child: Center(
                child: Text(
                  "Dil Do",
                  style: kheading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
