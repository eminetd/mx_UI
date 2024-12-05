import 'package:flutter/cupertino.dart';

class AlbumItemCard extends StatelessWidget {
  final ImageProvider image;
  const AlbumItemCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: image,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
