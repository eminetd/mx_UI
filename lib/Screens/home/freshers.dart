import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Freshers extends StatefulWidget {
  const Freshers({Key? key}) : super(key: key);

  @override
  State<Freshers> createState() => _FreshersState();
}

class _FreshersState extends State<Freshers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Gridview builder
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
              ),
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
                    Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage('assets/5stream.jpg'),
                              fit: BoxFit.fill)),
                      child: Transform.translate(
                        offset: Offset(40, -70),
                        child: Container(
                          // width: 10,
                          // height: 30,
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colors.mycyan),
                          child: Row(
                            children: [
                              Icon(Icons.star_border),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'New Star',
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
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
                          color: colors.whitegrey,
                        ),
                        child: Row(
                          children: [
                            Lottie.asset('assets/equilizer.json'),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text('556'),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
