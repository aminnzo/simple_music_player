import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VectorAsset extends StatelessWidget {
  final double size;
  final String? icon;
  final Color? color;

  const VectorAsset({Key? key, this.size = 24, required this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/vectors/$icon.svg',
        height: size, color: color);
  }
}
