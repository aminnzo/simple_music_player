import 'package:flutter/material.dart';
import 'package:simple_music_player/app/index_app.dart';

// ignore: non_constant_identifier_names
Widget TextBase(
  String text, {
  double? fontSize,
  double? height,
  FontWeight fontWeight = FontWeight.normal,
  Color color = ColorsBase.importantText,
  TextAlign textAlign = TextAlign.left,
  TextDirection textDirection = TextDirection.ltr,
  int? maxLines,
  bool softWrap = true,
  TextOverflow overflow = TextOverflow.clip,
  TextDecoration decoration = TextDecoration.none,
}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight,
        height: height,
        color: color,
        fontFamily: Fonts.Montserrat,
        decoration: decoration),
    textDirection: textDirection,
    textAlign: textAlign,
    maxLines: maxLines,
    softWrap: softWrap,
    overflow: overflow,
  );
}