String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'من فضلك أدخل البريد الإلكتروني';
  }

  final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  if (!emailRegex.hasMatch(value.trim())) {
    return 'من فضلك أدخل بريدًا إلكترونيًا صحيحًا';
  }
  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'من فضلك أدخل رقم الهاتف';
  }

  final normalized = value.replaceAll(RegExp(r'\s+'), '');
  if (!RegExp(r'^\d{10,15}$').hasMatch(normalized)) {
    return 'من فضلك أدخل رقم هاتف صحيحًا';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل كلمة المرور';
  }
  if (value.length < 8) {
    return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'كلمة المرور يجب أن تحتوي على حرف كبير';
  }
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'كلمة المرور يجب أن تحتوي على حرف صغير';
  }
  if (!RegExp(r'\d').hasMatch(value)) {
    return 'كلمة المرور يجب أن تحتوي على رقم';
  }
  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>\[\]\\/_\-+=`~;]').hasMatch(value)) {
    return 'كلمة المرور يجب أن تحتوي على رمز خاص';
  }
  return null;
}

String? confirmPasswordValidator(String? value, String originalPassword) {
  final passwordError = passwordValidator(value);
  if (passwordError != null) return passwordError;
  if (value != originalPassword) {
    return 'كلمتا المرور غير متطابقتين';
  }
  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'من فضلك أدخل الاسم الكامل';
  }
  if (value.trim().length < 3) {
    return 'الاسم يجب أن يكون 3 أحرف على الأقل';
  }
  return null;
}
