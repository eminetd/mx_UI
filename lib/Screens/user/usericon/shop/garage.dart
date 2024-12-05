import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Garage extends StatefulWidget {
  const Garage({Key? key}) : super(key: key);

  @override
  State<Garage> createState() => _GarageState();
}

class _GarageState extends State<Garage> {
  var isselect;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    isselect = 'Purchasable';
                    setState(() {});
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: isselect == 'Purchasable'
                            ? colors.gradient2pink
                            : colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Purchasable",
                        style: TextStyle(
                          fontSize: isselect == 'Purchasable' ? 20 : 17,
                          color: isselect == 'Purchasable'
                              ? colors.mywhite
                              : colors.myblack,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    isselect = 'Special';
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: isselect == 'Special'
                              ? colors.gradient2pink
                              : colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Special",
                          style: TextStyle(
                            fontSize: isselect == 'Special' ? 20 : 17,
                            color: isselect == 'Special'
                                ? colors.mywhite
                                : colors.myblack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isselect == 'Purchasable'
              ? GridView.builder(
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
                        Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage('assets/lambo.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 140),
                          child: Text(
                            "lamborghini",
                            style:
                                TextStyle(fontSize: 20, color: colors.mywhite),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 170),
                          child: Text(
                            "1,75,000 beans/week",
                            style:
                                TextStyle(fontSize: 20, color: colors.mywhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          isselect == 'Special'
              ? GridView.builder(
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
                        Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage('assets/lambo.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 140),
                          child: Text(
                            "lamborghini",
                            style:
                                TextStyle(fontSize: 20, color: colors.mywhite),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 170),
                          child: Text(
                            "1,75,000 beans/week",
                            style:
                                TextStyle(fontSize: 20, color: colors.mywhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    ));
  }
}
