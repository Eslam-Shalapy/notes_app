import 'package:flutter/material.dart';

AppBar customAppBar({
  required String text,
  required IconData icon,
  var onPressedIcon,
  bool automaticallyImplyLeading = false,
}) =>
    AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
        ),
      ),
      titleSpacing: 16.0,
      actions: [
        Container(
          margin: const EdgeInsets.only(
            right: 20.0,
            top: 10,
            bottom: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(.05),
          ),
          child: Center(
            child: IconButton(
              onPressed: onPressedIcon,
              icon: Icon(
                icon,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
