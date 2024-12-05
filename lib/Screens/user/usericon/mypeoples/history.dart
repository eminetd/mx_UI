import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Card(
                    shadowColor: Colors.blueGrey,
                    child: Container(
                      height: 80,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CircleAvatar(
                                backgroundColor: colors.transparent,
                                maxRadius: 40.0,
                                child: ClipRRect(
                                  child: Image.asset('assets/2stream.jpg'),
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 110),
                            child: Text(
                              "User Name",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 100),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: 20,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: colors.myred,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            'Lv 11',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: colors.mywhite),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: colors.yellow,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Icon(
                                            Icons.favorite,
                                            color: colors.myred,
                                            size: 18,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            '111',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: colors.myblack),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("Last Online :"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("10 days ago"),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
