import 'package:flutter/material.dart';
import 'package:notee/constants/const.dart';

Widget defaultButton({
  double height = 45,
  double width = double.infinity,
  double radius = 8,
  Color backgroundContainer = kPrimaryColor,
  Color colorText = Colors.black,
  bool isLoading = false,
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
        child: isLoading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: colorText,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
      ),
    );
