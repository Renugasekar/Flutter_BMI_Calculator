// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:bmi_calculator/constant_color.dart';
import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({ Key? key, required this.barWidth }) : super(key: key);
  final double barWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height:15,
          width:barWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color:theme2),
        ),

      ],
    );
  }
}