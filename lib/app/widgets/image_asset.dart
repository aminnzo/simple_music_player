import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ImageAsset(
      {Key? key,
        required this.image,
      this.width = 24,
      this.height = 24,
      this.fit = BoxFit.cover,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/$image',
        width: width, height: height, fit: fit);
  }
}
