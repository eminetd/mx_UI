// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Spotlight extends StatefulWidget {
  const Spotlight({Key? key}) : super(key: key);

  @override
  State<Spotlight> createState() => _SpotlightState();
}

class _SpotlightState extends State<Spotlight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.ellipsisVertical,
                    color: colors.indigo,
                    size: 20,
                  ),
                  Text(
                    "Editor's Pick",
                    style: TextStyle(color: colors.indigo, fontSize: 25),
                  )
                ],
              ),
            ),

            //

            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image(
                            image: AssetImage('assets/7stream.jpg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 140),
                          child: Text(
                            "User Name",
                            style:
                                TextStyle(fontSize: 20, color: colors.mywhite),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 40),
                          child: Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: colors.mywhite24,
                            ),
                            child: Row(
                              children: [
                                Lottie.asset('assets/equilizer.json'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Text(
                                    '556',
                                    style: TextStyle(color: colors.mywhite),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.ellipsisVertical,
                    color: colors.indigo,
                    size: 20,
                  ),
                  Text(
                    "Spotlight Talent",
                    style: TextStyle(color: colors.indigo, fontSize: 25),
                  )
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.zero,
                color: colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/reel');
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/3stream.jpg'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 160),
                      child: Text(
                        "User name",
                        style: TextStyle(fontSize: 20, color: colors.mywhite),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: colors.mywhite24,
                        ),
                        child: Row(
                          children: [
                            Lottie.asset('assets/equilizer.json'),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text(
                                '556',
                                style: TextStyle(color: colors.mywhite),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//
