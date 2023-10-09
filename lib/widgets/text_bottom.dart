import 'package:flutter/material.dart';
import 'package:notee/constants/const.dart';

Widget defaultButton({
  double height = 45,
  double width = double.infinity,
  double radius = 8,
  Color backgroundContainer = kPrimaryColor,
  Color colorText = Colors.black,
  required function,
  required String text,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundContainer,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: colorText,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
