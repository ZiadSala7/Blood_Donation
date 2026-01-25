import 'package:flutter/material.dart';

OutlineInputBorder buildBorder(
  Color color,
  double width, {
  double radius = 12,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: color, width: width),
  );
}
