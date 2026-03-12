import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

String? emailValidator(BuildContext context, String? value) {
  if (value == null || value.trim().isEmpty) {
    return S.of(context).validationEnterEmail;
  }

  final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  if (!emailRegex.hasMatch(value.trim())) {
    return S.of(context).validationEnterValidEmail;
  }
  return null;
}

String? phoneValidator(BuildContext context, String? value) {
  if (value == null || value.trim().isEmpty) {
    return S.of(context).validationEnterPhone;
  }

  final normalized = value.replaceAll(RegExp(r'\s+'), '');
  if (!RegExp(r'^\d{10,15}$').hasMatch(normalized)) {
    return S.of(context).validationEnterValidPhone;
  }
  return null;
}

String? passwordValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return S.of(context).validationEnterPassword;
  }
  if (value.length < 8) {
    return S.of(context).validationPasswordMinLength;
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return S.of(context).validationPasswordUppercase;
  }
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return S.of(context).validationPasswordLowercase;
  }
  if (!RegExp(r'\d').hasMatch(value)) {
    return S.of(context).validationPasswordNumber;
  }
  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>\[\]\\/_\-+=`~;]').hasMatch(value)) {
    return S.of(context).validationPasswordSpecial;
  }
  return null;
}

String? confirmPasswordValidator(
  BuildContext context,
  String? value,
  String originalPassword,
) {
  final passwordError = passwordValidator(context, value);
  if (passwordError != null) return passwordError;
  if (value != originalPassword) {
    return S.of(context).passwordsDoNotMatch;
  }
  return null;
}

String? nameValidator(BuildContext context, String? value) {
  if (value == null || value.trim().isEmpty) {
    return S.of(context).validationEnterFullName;
  }
  if (value.trim().length < 3) {
    return S.of(context).validationNameMinLength;
  }
  return null;
}
