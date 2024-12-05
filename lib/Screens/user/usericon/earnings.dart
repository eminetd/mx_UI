import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class Earnings extends StatefulWidget {
  const Earnings({Key? key}) : super(key: key);

  @override
  State<Earnings> createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Earnings',
          style: TextStyle(color: colors.myblack),
        ),
        backgroundColor: colors.mywhite,
      ),
    );
  }
}
