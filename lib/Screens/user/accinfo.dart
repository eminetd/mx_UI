import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 350,
              width: 500,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                colors.gradient1purple,
                colors.gradient2pink,

                // Color(0xFFe17763),
                // Color(0xFF68998c),
              ])),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.edit, color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.settings,
                            color: colors.mywhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: CircleAvatar(
                            child: Image.asset("assets/cartoon.png"),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 260, left: 150),
                    child: Row(
                      children: [
                        Text(
                          "Stranger",
                          style: TextStyle(color: colors.mywhite, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 300, left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ID:8568686',
                          style: TextStyle(color: colors.mywhite, fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '|',
                            style:
                                TextStyle(color: colors.mywhite, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'INDIA',
                            style:
                                TextStyle(color: colors.mywhite, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
