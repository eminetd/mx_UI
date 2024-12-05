import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:mtstreamapp/model/banner.dart';
import 'package:mtstreamapp/service/service.dart';
import 'package:mtstreamapp/widgets/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  final controller = CarouselController();
  int activeIndex = 0;
  int count = 0;
  String? cat = '';
  List<Sliders> banner = [];
  Future<List<Sliders>> banners() async {
    var url = Uri.parse(baseURL + 'all_apis.php?func=image_sliders');
    var Param = {'cat': 'HOME'};
    var response = await post(url, body: Param);

    if (response.statusCode == 200) {
      final data = AllBannersFromJson(response.body);
      data.sliders
          .map((e) => banner.add(
              Sliders(id: e.id, imgUrl: e.imgUrl, link: e.link, cat: e.cat)))
          .toList();
      print(data);
      //banner.add(data['slider']);
      // if (data['result'] == 'success') {
      //   var count = data['count'];
      //   print(count);
      //   var slider = data['slider'];
      // }

    }
    return banner;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1500,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        width: 380,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: colors.transparent),
                        child: FutureBuilder<List<Sliders>>(
                          future: banners(),
                          builder: (context, snapshot) {
                            count = snapshot.data?.length ?? 0;
                            if (snapshot.hasData) {
                              return CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: 180,
                                  initialPage: 0,
                                  autoPlay: true,
                                  viewportFraction: 1,
                                  enlargeCenterPage: true,
                                  autoPlayInterval: Duration(seconds: 2),
                                  onPageChanged: (index, reason) =>
                                      setState(() => activeIndex = index),
                                ),
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          snapshot.data![index].imgUrl,
                                          // fit: BoxFit.fill,
                                        ),
                                      ),

                                      // margin: EdgeInsets.symmetric(horizontal: 20),

                                      // color: Colors.grey,
                                    ),
                                    // child: buildIndicator(),
                                  );
                                },
                              );
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/toplist');
                        },
                        child: Image.asset("assets/crown1.png")),
                    Image.asset("assets/PK.png"),
                    Image.asset("assets/gift.png"),
                    Image.asset("assets/calender.png"),
                    Image.asset("assets/ring.png"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Records'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('PK'),
                  ),
                  Text('Lucky Draw'),
                  Text('Event'),
                  Text('Lucky Paisa')
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Row(
                  children: [
                    Image.asset("assets/icon.png"),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Text(
                        "Editor's Pick",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 75, 100, 212),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('/global')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data?.docs.length,
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
                                  Navigator.pushNamed(context, '/roomchat');
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data?.docs[index]['imageurl']),
                                          fit: BoxFit.fill)),
                                  child: Transform.translate(
                                    offset: Offset(40, -70),
                                    child: Container(
                                      // width: 10,
                                      // height: 30,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 80),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: colors.pinkaccent),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/crown1.png"),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              'Super Star',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 160),
                                child: Text(
                                  snapshot.data?.docs[index]["name"],
                                  style: TextStyle(
                                      fontSize: 20, color: colors.mywhite),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  height: 40,
                                  width: 60,
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
                                          "${snapshot.data?.docs[index]['count']}",
                                          style:
                                              TextStyle(color: colors.mywhite),
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
                    return CircularProgressIndicator();
                  }),

              // )
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildImage(int index, AsyncSnapshot<Sliders> snapshot) =>
  //     Container(
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           fit: BoxFit.cover,
  //           image: NetworkImage(),
  //           // fit: BoxFit.fill,
  //         ),
  //       ),

  //       // margin: EdgeInsets.symmetric(horizontal: 20),

  //       // color: Colors.grey,
  //       child: buildIndicator(),
  //     );

  Widget buildIndicator() => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: count,
            onDotClicked: animatetoSlide,
            effect: JumpingDotEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: colors.mywhite,
              dotColor: colors.mygrey,
            ),
          ),
        ),
      );

  void animatetoSlide(int index) => controller.animateToPage(index);

  void next() => controller.nextPage(duration: Duration(milliseconds: 100));

  void previous() =>
      controller.previousPage(duration: Duration(milliseconds: 100));
}

// ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemBuilder: (BuildContext context, int index) {
//     return Container(
//       height: 300,
//       width: 200,
//       margin: const EdgeInsets.only(left: 10),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: DecorationImage(
//             image: AssetImage('assets/PUP-21.jpg'),
//           )),
//     );
//   },
//   itemCount: 3,
// )
// GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//     mainAxisSpacing: 0,
//     crossAxisSpacing: 0,
//   ),
//   shrinkWrap: true,
//   physics: NeverScrollableScrollPhysics(),
//   itemCount: 10,
//   itemBuilder: (context, index) => Card(
//     margin: EdgeInsets.zero,
//     color: colors.transparent,
//     elevation: 0,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Stack(
//       children: [
//         Container(
//           margin: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                   image: AssetImage('assets/1stream.jpg'),
//                   fit: BoxFit.fill)),
//           child: Transform.translate(
//             offset: Offset(40, -70),
//             child: Container(
//               // width: 10,
//               // height: 30,
//               margin: EdgeInsets.symmetric(
//                   horizontal: 40, vertical: 80),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: colors.pinkaccent),
//               child: Row(
//                 children: [
//                   Image.asset("assets/crown1.png"),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 5),
//                     child: Text(
//                       'Super Star',
//                       style: TextStyle(fontSize: 15),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 20, top: 160),
//           child: Text(
//             "User name",
//             style: TextStyle(fontSize: 20, color: colors.mywhite),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             height: 40,
//             width: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: colors.mywhite24,
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.equalizer),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 3),
//                   child: Text('906'),
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     ),
//   ),
