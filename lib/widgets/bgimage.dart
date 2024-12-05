import 'package:flutter/material.dart';
import 'package:mtstreamapp/widgets/color.dart';

class BgImage extends StatelessWidget {
  const BgImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: ((bounds) => LinearGradient(
            colors: [colors.myblack, colors.myblack2],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ).createShader(bounds)),
      blendMode: BlendMode.difference,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/PUP-21.jpg'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken))),
      ),
    );
  }
}
