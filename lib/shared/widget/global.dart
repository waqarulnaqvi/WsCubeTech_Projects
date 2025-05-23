

import 'package:flutter/material.dart';

spacerH([double h=20])=>
  SizedBox(
    height: h,
  );

spacerW([double w=20])=>
  SizedBox(
    width: w,
  );

Image staticImage(String imagePath, {double? width, double? height}) {
  return Image.asset(
    imagePath,
    width: width,
    height: height,
  );
}