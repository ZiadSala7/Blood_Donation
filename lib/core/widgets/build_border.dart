import 'package:flutter/material.dart';

OutlineInputBorder buildBorder(Color color, double width) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color, width: width),
  );
}
