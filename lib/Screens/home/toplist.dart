import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class TopList extends StatefulWidget {
  const TopList({Key? key}) : super(key: key);

  @override
  State<TopList> createState() => _TopListState();
}

class _TopListState extends State<TopList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Top List",
          style: TextStyle(fontSize: 25, color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/topusers');
              },
              child: Container(
                height: 280,
                width: 200,
                decoration: BoxDecoration(
                  color: colors.gradient1purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Text(
                    'Top Users',
                    style: TextStyle(color: colors.mywhite, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 220),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/gifts');
              },
              child: Container(
                height: 130,
                width: 180,
                decoration: BoxDecoration(
                  color: colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70),
                  child: Text(
                    'Gifts',
                    style: TextStyle(color: colors.mywhite, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160, left: 220),
            child: Container(
              height: 130,
              width: 180,
              decoration: BoxDecoration(
                color: colors.myblue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 70),
                child: Text(
                  'New Star',
                  style: TextStyle(color: colors.mywhite, fontSize: 25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 310, left: 20),
            child: Container(
              height: 130,
              width: 380,
              decoration: BoxDecoration(
                color: colors.gradient2pink,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 70),
                child: Text(
                  'Weekly Stars',
                  style: TextStyle(color: colors.mywhite, fontSize: 25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 450, left: 20),
            child: Container(
              height: 130,
              width: 180,
              decoration: BoxDecoration(
                color: colors.mycyan,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 70),
                child: Text(
                  'Special events',
                  style: TextStyle(color: colors.myblack, fontSize: 25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 590, left: 20),
            child: Container(
              height: 130,
              width: 180,
              decoration: BoxDecoration(
                color: colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 70),
                child: Text(
                  'Game',
                  style: TextStyle(color: colors.myblack, fontSize: 25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 450, left: 220),
            child: Container(
              height: 260,
              width: 180,
              decoration: BoxDecoration(
                color: colors.orange2,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  'Combo ',
                  style: TextStyle(color: colors.mywhite, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mtstreamapp/widgets/color.dart';

// class TopList extends StatefulWidget {
//   const TopList({Key? key}) : super(key: key);

//   @override
//   State<TopList> createState() => _TopListState();
// }

// class _TopListState extends State<TopList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(
//           "Top List",
//           style: TextStyle(fontSize: 25, color: colors.myblack),
//         ),
//         backgroundColor: colors.mywhite,
//       ),
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 10, top: 20),
//             child: Container(
//               height: 280,
//               width: 200,
//               decoration: BoxDecoration(
//                 color: colors.gradient1purple,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 30, left: 30),
//                 child: Text(
//                   'Top Users',
//                   style: TextStyle(color: colors.mywhite, fontSize: 25),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20, left: 220),
//             child: Container(
//               height: 130,
//               width: 180,
//               decoration: BoxDecoration(
//                 color: colors.orange,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 30, left: 70),
//                 child: Text(
//                   'Top Talents',
//                   style: TextStyle(color: colors.mywhite, fontSize: 25),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 160, left: 220),
//             child: Container(
//               height: 130,
//               width: 180,
//               decoration: BoxDecoration(
//                 color: colors.myblue,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 40, left: 70),
//                 child: Text(
//                   'New Star',
//                   style: TextStyle(color: colors.mywhite, fontSize: 25),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 310, left: 20),
//             child: Container(
//               height: 130,
//               width: 380,
//               decoration: BoxDecoration(
//                 color: colors.gradient2pink,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 40, left: 70),
//                 child: Text(
//                   'Weekly Stars',
//                   style: TextStyle(color: colors.mywhite, fontSize: 25),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 450, left: 20),
//             child: Container(
//               height: 130,
//               width: 180,
//               decoration: BoxDecoration(
//                 color: colors.mycyan,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 40, left: 70),
//                 child: Text(
//                   'Special events',
//                   style: TextStyle(color: colors.myblack, fontSize: 25),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 590, left: 20),
//             child: Container(
//               height: 130,
//               width: 180,
//               decoration: BoxDecoration(
//                 color: colors.green,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 40, left: 70),
//                 child: Text(
//                   'Game',
//                   style: TextStyle(color: colors.myblack, fontSize: 25),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 450, left: 220),
//             child: Container(
//               height: 260,
//               width: 180,
//               decoration: BoxDecoration(
//                 color: colors.orange2,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 30, left: 30),
//                 child: Text(
//                   'Combo ',
//                   style: TextStyle(color: colors.mywhite, fontSize: 25),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
