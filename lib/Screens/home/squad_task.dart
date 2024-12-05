import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class SquadTask extends StatefulWidget {
  const SquadTask({Key? key}) : super(key: key);

  @override
  State<SquadTask> createState() => _SquadTaskState();
}

class _SquadTaskState extends State<SquadTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        height: 70,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Image(
                                image: AssetImage('assets/diamond.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60, top: 10),
                              child: Text('Check In'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60, top: 40),
                              child: Text("message"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 310, top: 20),
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colors.mygrey,
                                ),
                                child: Center(
                                  child: Text(
                                    'ToDo',
                                    style: TextStyle(
                                        fontSize: 15, color: colors.mywhite),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
