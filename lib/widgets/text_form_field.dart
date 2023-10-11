import 'package:flutter/material.dart';
import 'package:notee/constants/const.dart';

Widget customTextFormField({
  required String labelText,
  String? hintText,
  var validator,
  var onSaved,
  var onSubmitted,
  var onChanged,
  TextEditingController? controller,
  IconData? prefixIcon,
  IconData? suffixIcon,
  var suffixIconPressed,
  bool obSucre = false,
  Color cursorColor = kPrimaryColor,
  int maxLines = 1,
  Color colorIcon = Colors.white,
}) =>
    TextFormField(
      maxLines: maxLines,
      cursorColor: cursorColor,
      obscureText: obSucre,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: kPrimaryColor,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixIconPressed,
                icon: Icon(
                  suffixIcon,
                  color: colorIcon,
                ),
              )
            : null,
        prefixIcon: Icon(
          prefixIcon,
          color: colorIcon,
        ),
      ),
    );
