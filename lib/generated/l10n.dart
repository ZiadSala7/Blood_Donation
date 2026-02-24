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

  /// `Donate Blood Easily`
  String get onbrd1Title {
    return Intl.message(
      'Donate Blood Easily',
      name: 'onbrd1Title',
      desc: '',
      args: [],
    );
  }

  /// `Help save lives with a simple step!`
  String get onbrd1Descr {
    return Intl.message(
      'Help save lives with a simple step!',
      name: 'onbrd1Descr',
      desc: '',
      args: [],
    );
  }

  /// `Find the Nearest Person`
  String get onbrd2Title {
    return Intl.message(
      'Find the Nearest Person',
      name: 'onbrd2Title',
      desc: '',
      args: [],
    );
  }

  /// `We'll locate the nearest donation center so you can help quickly`
  String get onbrd2Descr {
    return Intl.message(
      'We\'ll locate the nearest donation center so you can help quickly',
      name: 'onbrd2Descr',
      desc: '',
      args: [],
    );
  }

  /// `Your Donation Makes a Difference`
  String get onbrd3Title {
    return Intl.message(
      'Your Donation Makes a Difference',
      name: 'onbrd3Title',
      desc: '',
      args: [],
    );
  }

  /// `Every donation can save a life`
  String get onbrd3Descr {
    return Intl.message(
      'Every donation can save a life',
      name: 'onbrd3Descr',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get onbrd4Title {
    return Intl.message('Welcome', name: 'onbrd4Title', desc: '', args: []);
  }

  /// `Thank you for joining the journey of giving and change.`
  String get onbrd4Descr {
    return Intl.message(
      'Thank you for joining the journey of giving and change.',
      name: 'onbrd4Descr',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Start Now`
  String get startNow {
    return Intl.message('Start Now', name: 'startNow', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your email`
  String get entrEmail {
    return Intl.message(
      'Enter your email',
      name: 'entrEmail',
      desc: '',
      args: [],
    );
  }

  /// `***********`
  String get entrPassw {
    return Intl.message('***********', name: 'entrPassw', desc: '', args: []);
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message('Remember Me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Forgot your password?`
  String get doYouforgetPass {
    return Intl.message(
      'Forgot your password?',
      name: 'doYouforgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAcc {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAcc',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get makeAcc {
    return Intl.message(
      'Create an account',
      name: 'makeAcc',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPass {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPass',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Enter your full name`
  String get entrFullName {
    return Intl.message(
      'Enter your full name',
      name: 'entrFullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNum {
    return Intl.message('Phone Number', name: 'phoneNum', desc: '', args: []);
  }

  /// `Enter your phone number`
  String get entrPhoneNum {
    return Intl.message(
      'Enter your phone number',
      name: 'entrPhoneNum',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Blood Type`
  String get bloodType {
    return Intl.message('Blood Type', name: 'bloodType', desc: '', args: []);
  }

  /// `Governorate`
  String get city {
    return Intl.message('Governorate', name: 'city', desc: '', args: []);
  }

  /// `City`
  String get town {
    return Intl.message('City', name: 'town', desc: '', args: []);
  }

  /// `Create Account`
  String get createAcc {
    return Intl.message(
      'Create Account',
      name: 'createAcc',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAcc {
    return Intl.message(
      'Already have an account?',
      name: 'haveAcc',
      desc: '',
      args: [],
    );
  }

  /// `Login here`
  String get loginHere {
    return Intl.message('Login here', name: 'loginHere', desc: '', args: []);
  }

  /// `Search with hospital name`
  String get hosName {
    return Intl.message(
      'Search with hospital name',
      name: 'hosName',
      desc: '',
      args: [],
    );
  }

  /// `Successful Register`
  String get regSucc {
    return Intl.message(
      'Successful Register',
      name: 'regSucc',
      desc: '',
      args: [],
    );
  }

  /// `Verify your account then go to login page`
  String get regSuccDesc {
    return Intl.message(
      'Verify your account then go to login page',
      name: 'regSuccDesc',
      desc: '',
      args: [],
    );
  }

  /// `Register Failed`
  String get regFail {
    return Intl.message('Register Failed', name: 'regFail', desc: '', args: []);
  }

  /// `Successful Login`
  String get loginSucc {
    return Intl.message(
      'Successful Login',
      name: 'loginSucc',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back !`
  String get loginSuccDesc {
    return Intl.message(
      'Welcome back !',
      name: 'loginSuccDesc',
      desc: '',
      args: [],
    );
  }

  /// `Create Request`
  String get addRqustBtn {
    return Intl.message(
      'Create Request',
      name: 'addRqustBtn',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you an OTP code to reset your password.`
  String get forgPassValidate {
    return Intl.message(
      'Enter your email address and we will send you an OTP code to reset your password.',
      name: 'forgPassValidate',
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
