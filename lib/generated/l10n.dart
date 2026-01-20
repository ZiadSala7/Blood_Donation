// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `تبرع بالدم بسهولة`
  String get onbrd1Title {
    return Intl.message(
      'تبرع بالدم بسهولة',
      name: 'onbrd1Title',
      desc: '',
      args: [],
    );
  }

  /// `ساعد في إنقاذ حياة غيرك \nبخطوة بسيطة!`
  String get onbrd1Descr {
    return Intl.message(
      'ساعد في إنقاذ حياة غيرك \nبخطوة بسيطة!',
      name: 'onbrd1Descr',
      desc: '',
      args: [],
    );
  }

  /// `اعرف أقرب شخص ليك`
  String get onbrd2Title {
    return Intl.message(
      'اعرف أقرب شخص ليك',
      name: 'onbrd2Title',
      desc: '',
      args: [],
    );
  }

  /// `بنحدد لك أقرب مكان للتبرع علشان تقدر تساعد بسرعة`
  String get onbrd2Descr {
    return Intl.message(
      'بنحدد لك أقرب مكان للتبرع علشان تقدر تساعد بسرعة',
      name: 'onbrd2Descr',
      desc: '',
      args: [],
    );
  }

  /// `تبرعك بيصنع فرق`
  String get onbrd3Title {
    return Intl.message(
      'تبرعك بيصنع فرق',
      name: 'onbrd3Title',
      desc: '',
      args: [],
    );
  }

  /// `كل تبرع ممكن ينقذ حياة`
  String get onbrd3Descr {
    return Intl.message(
      'كل تبرع ممكن ينقذ حياة',
      name: 'onbrd3Descr',
      desc: '',
      args: [],
    );
  }

  /// `أهلاً بك`
  String get onbrd4Title {
    return Intl.message('أهلاً بك', name: 'onbrd4Title', desc: '', args: []);
  }

  /// `شكراً لانضمامك لرحلة العطاء والتغيير.`
  String get onbrd4Descr {
    return Intl.message(
      'شكراً لانضمامك لرحلة العطاء والتغيير.',
      name: 'onbrd4Descr',
      desc: '',
      args: [],
    );
  }

  /// `تخطي`
  String get skip {
    return Intl.message('تخطي', name: 'skip', desc: '', args: []);
  }

  /// `ابدأ الآن`
  String get startNow {
    return Intl.message('ابدأ الآن', name: 'startNow', desc: '', args: []);
  }

  /// ` البريد الإلكتروني `
  String get email {
    return Intl.message(
      ' البريد الإلكتروني ',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `  كلمة السر`
  String get password {
    return Intl.message('  كلمة السر', name: 'password', desc: '', args: []);
  }

  /// `أدخل البريد الإلكتروني`
  String get entrEmail {
    return Intl.message(
      'أدخل البريد الإلكتروني',
      name: 'entrEmail',
      desc: '',
      args: [],
    );
  }

  /// `............`
  String get entrPassw {
    return Intl.message('............', name: 'entrPassw', desc: '', args: []);
  }

  /// `تذكرني`
  String get rememberMe {
    return Intl.message('تذكرني', name: 'rememberMe', desc: '', args: []);
  }

  /// `هل نسيت كلمة السر ؟`
  String get doYouforgetPass {
    return Intl.message(
      'هل نسيت كلمة السر ؟',
      name: 'doYouforgetPass',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول `
  String get login {
    return Intl.message('تسجيل الدخول ', name: 'login', desc: '', args: []);
  }

  /// `تسجيل الدخول بواسطة جوجل `
  String get loginWithGoogle {
    return Intl.message(
      'تسجيل الدخول بواسطة جوجل ',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب ؟`
  String get dontHaveAcc {
    return Intl.message(
      'ليس لديك حساب ؟',
      name: 'dontHaveAcc',
      desc: '',
      args: [],
    );
  }

  /// `قم بإنشاء حساب `
  String get makeAcc {
    return Intl.message('قم بإنشاء حساب ', name: 'makeAcc', desc: '', args: []);
  }

  /// ` تاكيد كلمةالسر `
  String get confirmPass {
    return Intl.message(
      ' تاكيد كلمةالسر ',
      name: 'confirmPass',
      desc: '',
      args: [],
    );
  }

  /// ` الاسم الكامل `
  String get fullName {
    return Intl.message(' الاسم الكامل ', name: 'fullName', desc: '', args: []);
  }

  /// `ادخل اسمك بالكامل   `
  String get entrFullName {
    return Intl.message(
      'ادخل اسمك بالكامل   ',
      name: 'entrFullName',
      desc: '',
      args: [],
    );
  }

  /// ` رقم الهاتف `
  String get phoneNum {
    return Intl.message(' رقم الهاتف ', name: 'phoneNum', desc: '', args: []);
  }

  /// `أدخل رقم الهاتف`
  String get entrPhoneNum {
    return Intl.message(
      'أدخل رقم الهاتف',
      name: 'entrPhoneNum',
      desc: '',
      args: [],
    );
  }

  /// `العمر`
  String get age {
    return Intl.message('العمر', name: 'age', desc: '', args: []);
  }

  /// `النوع `
  String get gender {
    return Intl.message('النوع ', name: 'gender', desc: '', args: []);
  }

  /// `فصيلة الدم `
  String get bloodType {
    return Intl.message('فصيلة الدم ', name: 'bloodType', desc: '', args: []);
  }

  /// `المحافظة`
  String get city {
    return Intl.message('المحافظة', name: 'city', desc: '', args: []);
  }

  /// `المدينة`
  String get town {
    return Intl.message('المدينة', name: 'town', desc: '', args: []);
  }

  /// `إنشاء حساب`
  String get createAcc {
    return Intl.message('إنشاء حساب', name: 'createAcc', desc: '', args: []);
  }

  /// `هل لديك حساب بالفعل؟`
  String get haveAcc {
    return Intl.message(
      'هل لديك حساب بالفعل؟',
      name: 'haveAcc',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول من هنا`
  String get loginHere {
    return Intl.message(
      'تسجيل الدخول من هنا',
      name: 'loginHere',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
