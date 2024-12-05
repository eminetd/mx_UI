import 'package:flutter/material.dart';
import 'package:mtstreamapp/Screens/user/usericon/shop/garage.dart';
import 'package:mtstreamapp/Screens/user/usericon/shop/luckyid.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'StreamKar',
              style: TextStyle(color: colors.myblack),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: TextStyle(color: colors.mygrey),
              ),
            ),
          ],
        ),
        backgroundColor: colors.mywhite,
      ),
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TabBar(
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 65, right: 65),
                  // controller: _tabController,
                  labelColor: colors.mygrey,
                  unselectedLabelStyle:
                      TextStyle(fontSize: 20.0, color: colors.myblack),
                  labelStyle: TextStyle(fontSize: 20.0, color: colors.mygrey),
                  unselectedLabelColor: colors.mygrey,
                  tabs: [
                    Tab(text: 'Garage'),
                    Tab(text: 'LuckyID'),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  // controller: _tabController,
                  children: [
                    Garage(),
                    LuckyID(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
