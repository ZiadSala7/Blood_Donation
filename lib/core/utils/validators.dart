/// ============== Email Validator =================
String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل رقم الهاتف';
  }
  if (value.length < 11) {
    return 'رقم الهاتف غير صحيح';
  }
  return null;
}

/// ============== Password Validator ==============

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل كلمة السر';
  }
  if (value.length < 6) {
    return 'كلمة السر يجب أن تكون 6 أحرف على الأقل';
  }
  return null;
}

/// ============ Name Validator ==============

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل الاسم الكامل';
  }
  return null;
}
