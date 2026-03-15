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

  /// `Forget Password?`
  String get areForgPass {
    return Intl.message(
      'Forget Password?',
      name: 'areForgPass',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get sendOtp {
    return Intl.message('Send OTP', name: 'sendOtp', desc: '', args: []);
  }

  /// `Confirm your email`
  String get confirmPassForget {
    return Intl.message(
      'Confirm your email',
      name: 'confirmPassForget',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPass {
    return Intl.message(
      'Reset Password',
      name: 'resetPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter a new password for your account`
  String get enterNewPass {
    return Intl.message(
      'Enter a new password for your account',
      name: 'enterNewPass',
      desc: '',
      args: [],
    );
  }

  /// `New passowrd`
  String get newPass {
    return Intl.message('New passowrd', name: 'newPass', desc: '', args: []);
  }

  /// `Confirm new password`
  String get confirmNewPass {
    return Intl.message(
      'Confirm new password',
      name: 'confirmNewPass',
      desc: '',
      args: [],
    );
  }

  /// `Save Password`
  String get savePass {
    return Intl.message('Save Password', name: 'savePass', desc: '', args: []);
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePass {
    return Intl.message(
      'Change Password',
      name: 'changePass',
      desc: '',
      args: [],
    );
  }

  /// `Enter your current password, then the new one`
  String get changePassDesc {
    return Intl.message(
      'Enter your current password, then the new one',
      name: 'changePassDesc',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPass {
    return Intl.message(
      'Current Password',
      name: 'currentPass',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Select date of birth`
  String get selectDateOfBirth {
    return Intl.message(
      'Select date of birth',
      name: 'selectDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Please select your date of birth`
  String get dateOfBirthRequired {
    return Intl.message(
      'Please select your date of birth',
      name: 'dateOfBirthRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please complete all required fields`
  String get completeRequiredFields {
    return Intl.message(
      'Please complete all required fields',
      name: 'completeRequiredFields',
      desc: '',
      args: [],
    );
  }

  /// `Please select a valid city`
  String get selectValidCity {
    return Intl.message(
      'Please select a valid city',
      name: 'selectValidCity',
      desc: '',
      args: [],
    );
  }

  /// `Blood type`
  String get bloodTypeLabel {
    return Intl.message(
      'Blood type',
      name: 'bloodTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter case description`
  String get caseDescriptionHint {
    return Intl.message(
      'Enter case description',
      name: 'caseDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Case description`
  String get caseDescriptionLabel {
    return Intl.message(
      'Case description',
      name: 'caseDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Case details`
  String get caseDetailsTitle {
    return Intl.message(
      'Case details',
      name: 'caseDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Case information`
  String get caseInfoLabel {
    return Intl.message(
      'Case information',
      name: 'caseInfoLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter case name`
  String get caseNameHint {
    return Intl.message(
      'Enter case name',
      name: 'caseNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Case name`
  String get caseNameLabel {
    return Intl.message('Case name', name: 'caseNameLabel', desc: '', args: []);
  }

  /// `City center`
  String get cityCenterLabel {
    return Intl.message(
      'City center',
      name: 'cityCenterLabel',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get cityLabel {
    return Intl.message('City', name: 'cityLabel', desc: '', args: []);
  }

  /// `Collected {collected} / {total}`
  String collectedBagsCount(Object collected, Object total) {
    return Intl.message(
      'Collected $collected / $total',
      name: 'collectedBagsCount',
      desc: '',
      args: [collected, total],
    );
  }

  /// `Confirm`
  String get confirmLabel {
    return Intl.message('Confirm', name: 'confirmLabel', desc: '', args: []);
  }

  /// `Create donation request`
  String get createDonationRequestTitle {
    return Intl.message(
      'Create donation request',
      name: 'createDonationRequestTitle',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get dash {
    return Intl.message('-', name: 'dash', desc: '', args: []);
  }

  /// `D`
  String get defaultAvatarInitial {
    return Intl.message('D', name: 'defaultAvatarInitial', desc: '', args: []);
  }

  /// `Unknown city`
  String get defaultCity {
    return Intl.message(
      'Unknown city',
      name: 'defaultCity',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get defaultUserName {
    return Intl.message('User', name: 'defaultUserName', desc: '', args: []);
  }

  /// `Description`
  String get descriptionLabel {
    return Intl.message(
      'Description',
      name: 'descriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Donate now`
  String get donateNow {
    return Intl.message('Donate now', name: 'donateNow', desc: '', args: []);
  }

  /// `Donation deadline:`
  String get donationDeadlineLabel {
    return Intl.message(
      'Donation deadline:',
      name: 'donationDeadlineLabel',
      desc: '',
      args: [],
    );
  }

  /// `Donation information`
  String get donationInfoLabel {
    return Intl.message(
      'Donation information',
      name: 'donationInfoLabel',
      desc: '',
      args: [],
    );
  }

  /// `Donations`
  String get donationsCountLabel {
    return Intl.message(
      'Donations',
      name: 'donationsCountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Donation recorded successfully`
  String get donationSuccessMessage {
    return Intl.message(
      'Donation recorded successfully',
      name: 'donationSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Select donation type`
  String get donationTypeHint {
    return Intl.message(
      'Select donation type',
      name: 'donationTypeHint',
      desc: '',
      args: [],
    );
  }

  /// `Donor responses`
  String get donorResponsesTitle {
    return Intl.message(
      'Donor responses',
      name: 'donorResponsesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Donor ID`
  String get donorIdLabel {
    return Intl.message('Donor ID', name: 'donorIdLabel', desc: '', args: []);
  }

  /// `Donors`
  String get donorsLabel {
    return Intl.message('Donors', name: 'donorsLabel', desc: '', args: []);
  }

  /// `Earlier`
  String get earlierLabel {
    return Intl.message('Earlier', name: 'earlierLabel', desc: '', args: []);
  }

  /// `Ends in {days} days`
  String endsInDays(Object days) {
    return Intl.message(
      'Ends in $days days',
      name: 'endsInDays',
      desc: '',
      args: [days],
    );
  }

  /// `Error`
  String get errorTitle {
    return Intl.message('Error', name: 'errorTitle', desc: '', args: []);
  }

  /// `Filter & Sort`
  String get filterSortTitle {
    return Intl.message(
      'Filter & Sort',
      name: 'filterSortTitle',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get genderFemale {
    return Intl.message('Female', name: 'genderFemale', desc: '', args: []);
  }

  /// `Male`
  String get genderMale {
    return Intl.message('Male', name: 'genderMale', desc: '', args: []);
  }

  /// `Something went wrong. Try again.`
  String get genericErrorRetry {
    return Intl.message(
      'Something went wrong. Try again.',
      name: 'genericErrorRetry',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load data`
  String get genericLoadError {
    return Intl.message(
      'Failed to load data',
      name: 'genericLoadError',
      desc: '',
      args: [],
    );
  }

  /// `Google login failed`
  String get googleLoginFailed {
    return Intl.message(
      'Google login failed',
      name: 'googleLoginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Google token error`
  String get googleTokenError {
    return Intl.message(
      'Google token error',
      name: 'googleTokenError',
      desc: '',
      args: [],
    );
  }

  /// `Governorate`
  String get governorateLabel {
    return Intl.message(
      'Governorate',
      name: 'governorateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Hello, {name}`
  String greeting(Object name) {
    return Intl.message(
      'Hello, $name',
      name: 'greeting',
      desc: '',
      args: [name],
    );
  }

  /// `Helped cases`
  String get helpCasesLabel {
    return Intl.message(
      'Helped cases',
      name: 'helpCasesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Hospital name`
  String get hospitalNameHint {
    return Intl.message(
      'Hospital name',
      name: 'hospitalNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Please complete all required fields`
  String get incompleteDataDesc {
    return Intl.message(
      'Please complete all required fields',
      name: 'incompleteDataDesc',
      desc: '',
      args: [],
    );
  }

  /// `Incomplete data`
  String get incompleteDataTitle {
    return Intl.message(
      'Incomplete data',
      name: 'incompleteDataTitle',
      desc: '',
      args: [],
    );
  }

  /// `Last deadline`
  String get lastDeadlineLabel {
    return Intl.message(
      'Last deadline',
      name: 'lastDeadlineLabel',
      desc: '',
      args: [],
    );
  }

  /// `Live`
  String get liveLabel {
    return Intl.message('Live', name: 'liveLabel', desc: '', args: []);
  }

  /// `Loading...`
  String get loadingLabel {
    return Intl.message('Loading...', name: 'loadingLabel', desc: '', args: []);
  }

  /// `Location`
  String get locationTitle {
    return Intl.message('Location', name: 'locationTitle', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get logoutConfirmMessage {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutConfirmMessage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutLabel {
    return Intl.message('Logout', name: 'logoutLabel', desc: '', args: []);
  }

  /// `Mark all as read`
  String get markAllAsRead {
    return Intl.message(
      'Mark all as read',
      name: 'markAllAsRead',
      desc: '',
      args: [],
    );
  }

  /// `Matching blood type: {bloodType}`
  String matchingBloodType(Object bloodType) {
    return Intl.message(
      'Matching blood type: $bloodType',
      name: 'matchingBloodType',
      desc: '',
      args: [bloodType],
    );
  }

  /// `Start your first donation today`
  String get motivationalStart {
    return Intl.message(
      'Start your first donation today',
      name: 'motivationalStart',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your help`
  String get motivationalThanks {
    return Intl.message(
      'Thank you for your help',
      name: 'motivationalThanks',
      desc: '',
      args: [],
    );
  }

  /// `You're a top donor!`
  String get motivationalTopDonor {
    return Intl.message(
      'You\'re a top donor!',
      name: 'motivationalTopDonor',
      desc: '',
      args: [],
    );
  }

  /// `My blood type only`
  String get myBloodTypeOnly {
    return Intl.message(
      'My blood type only',
      name: 'myBloodTypeOnly',
      desc: '',
      args: [],
    );
  }

  /// `My information`
  String get myInfoTitle {
    return Intl.message(
      'My information',
      name: 'myInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `My requests`
  String get myRequestsTitle {
    return Intl.message(
      'My requests',
      name: 'myRequestsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navHome {
    return Intl.message('Home', name: 'navHome', desc: '', args: []);
  }

  /// `Notifications`
  String get navNotifications {
    return Intl.message(
      'Notifications',
      name: 'navNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get navProfile {
    return Intl.message('Profile', name: 'navProfile', desc: '', args: []);
  }

  /// `Requests`
  String get navRequests {
    return Intl.message('Requests', name: 'navRequests', desc: '', args: []);
  }

  /// `Nearby requests`
  String get nearbyRequestsTitle {
    return Intl.message(
      'Nearby requests',
      name: 'nearbyRequestsTitle',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get noLabel {
    return Intl.message('No', name: 'noLabel', desc: '', args: []);
  }

  /// `No notifications`
  String get noNotifications {
    return Intl.message(
      'No notifications',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `No requests available right now`
  String get noRequestsDescription {
    return Intl.message(
      'No requests available right now',
      name: 'noRequestsDescription',
      desc: '',
      args: [],
    );
  }

  /// `No requests`
  String get noRequestsTitle {
    return Intl.message(
      'No requests',
      name: 'noRequestsTitle',
      desc: '',
      args: [],
    );
  }

  /// `No requests yet`
  String get noRequestsYet {
    return Intl.message(
      'No requests yet',
      name: 'noRequestsYet',
      desc: '',
      args: [],
    );
  }

  /// `No responses yet`
  String get noResponsesYet {
    return Intl.message(
      'No responses yet',
      name: 'noResponsesYet',
      desc: '',
      args: [],
    );
  }

  /// `Blood request`
  String get notificationBloodRequestTitle {
    return Intl.message(
      'Blood request',
      name: 'notificationBloodRequestTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notification details`
  String get notificationDetailsTitle {
    return Intl.message(
      'Notification details',
      name: 'notificationDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Donor accepted`
  String get notificationDonorAcceptedTitle {
    return Intl.message(
      'Donor accepted',
      name: 'notificationDonorAcceptedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Important alert`
  String get notificationImportantAlertTitle {
    return Intl.message(
      'Important alert',
      name: 'notificationImportantAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `Request completed`
  String get notificationRequestCompletedTitle {
    return Intl.message(
      'Request completed',
      name: 'notificationRequestCompletedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notification settings`
  String get notificationSettingsTitle {
    return Intl.message(
      'Notification settings',
      name: 'notificationSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notificationsTitle {
    return Intl.message(
      'Notifications',
      name: 'notificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Thank you`
  String get notificationThankYouTitle {
    return Intl.message(
      'Thank you',
      name: 'notificationThankYouTitle',
      desc: '',
      args: [],
    );
  }

  /// `On the way`
  String get onTheWay {
    return Intl.message('On the way', name: 'onTheWay', desc: '', args: []);
  }

  /// `Operation failed`
  String get operationFailedTitle {
    return Intl.message(
      'Operation failed',
      name: 'operationFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Operation successful`
  String get operationSuccessTitle {
    return Intl.message(
      'Operation successful',
      name: 'operationSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to {email}`
  String otpEnterCode(Object email) {
    return Intl.message(
      'Enter the code sent to $email',
      name: 'otpEnterCode',
      desc: '',
      args: [email],
    );
  }

  /// `Resend code`
  String get otpResendCode {
    return Intl.message(
      'Resend code',
      name: 'otpResendCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend in {time}`
  String otpResendIn(Object time) {
    return Intl.message(
      'Resend in $time',
      name: 'otpResendIn',
      desc: '',
      args: [time],
    );
  }

  /// `Code resent`
  String get otpResent {
    return Intl.message('Code resent', name: 'otpResent', desc: '', args: []);
  }

  /// `Next`
  String get paginationNext {
    return Intl.message('Next', name: 'paginationNext', desc: '', args: []);
  }

  /// `Previous`
  String get paginationPrev {
    return Intl.message('Previous', name: 'paginationPrev', desc: '', args: []);
  }

  /// `Password changed successfully`
  String get passwordChangedSuccess {
    return Intl.message(
      'Password changed successfully',
      name: 'passwordChangedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Patient name`
  String get patientNameLabel {
    return Intl.message(
      'Patient name',
      name: 'patientNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumberLabel {
    return Intl.message(
      'Phone number',
      name: 'phoneNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Location information`
  String get placeInfoLabel {
    return Intl.message(
      'Location information',
      name: 'placeInfoLabel',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get profileActivityTitle {
    return Intl.message(
      'Activity',
      name: 'profileActivityTitle',
      desc: '',
      args: [],
    );
  }

  /// `Donation history`
  String get profileDonationHistoryTitle {
    return Intl.message(
      'Donation history',
      name: 'profileDonationHistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Personal data`
  String get profilePersonalDataTitle {
    return Intl.message(
      'Personal data',
      name: 'profilePersonalDataTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get profileSettingsTitle {
    return Intl.message(
      'Settings',
      name: 'profileSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verify your account then log in`
  String get registerSuccessDesc {
    return Intl.message(
      'Verify your account then log in',
      name: 'registerSuccessDesc',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful`
  String get registerSuccessTitle {
    return Intl.message(
      'Registration successful',
      name: 'registerSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Arrived`
  String get requestArrived {
    return Intl.message('Arrived', name: 'requestArrived', desc: '', args: []);
  }

  /// `No longer accepting requests`
  String get requestClosedMessage {
    return Intl.message(
      'No longer accepting requests',
      name: 'requestClosedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Completion {percent}%`
  String requestCompletionPercent(Object percent) {
    return Intl.message(
      'Completion $percent%',
      name: 'requestCompletionPercent',
      desc: '',
      args: [percent],
    );
  }

  /// `Request created successfully`
  String get requestCreatedSuccessDesc {
    return Intl.message(
      'Request created successfully',
      name: 'requestCreatedSuccessDesc',
      desc: '',
      args: [],
    );
  }

  /// `Request date: {date}`
  String requestDate(Object date) {
    return Intl.message(
      'Request date: $date',
      name: 'requestDate',
      desc: '',
      args: [date],
    );
  }

  /// `Request details`
  String get requestDetailsTitle {
    return Intl.message(
      'Request details',
      name: 'requestDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Request publisher`
  String get requestPublisher {
    return Intl.message(
      'Request publisher',
      name: 'requestPublisher',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get requestRequired {
    return Intl.message(
      'Required',
      name: 'requestRequired',
      desc: '',
      args: [],
    );
  }

  /// `Required donors`
  String get requiredDonorsCount {
    return Intl.message(
      'Required donors',
      name: 'requiredDonorsCount',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get resetLabel {
    return Intl.message('Reset', name: 'resetLabel', desc: '', args: []);
  }

  /// `Password reset successful`
  String get resetPasswordSuccessDesc {
    return Intl.message(
      'Password reset successful',
      name: 'resetPasswordSuccessDesc',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retryLabel {
    return Intl.message('Retry', name: 'retryLabel', desc: '', args: []);
  }

  /// `Select city`
  String get selectCity {
    return Intl.message('Select city', name: 'selectCity', desc: '', args: []);
  }

  /// `Select date`
  String get selectDate {
    return Intl.message('Select date', name: 'selectDate', desc: '', args: []);
  }

  /// `Select governorate`
  String get selectGovernorate {
    return Intl.message(
      'Select governorate',
      name: 'selectGovernorate',
      desc: '',
      args: [],
    );
  }

  /// `Unable to reach server. Try again.`
  String get serverConnectionFailedDesc {
    return Intl.message(
      'Unable to reach server. Try again.',
      name: 'serverConnectionFailedDesc',
      desc: '',
      args: [],
    );
  }

  /// `Connection failed`
  String get serverConnectionFailedTitle {
    return Intl.message(
      'Connection failed',
      name: 'serverConnectionFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Show results`
  String get showResults {
    return Intl.message(
      'Show results',
      name: 'showResults',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get sortByLabel {
    return Intl.message('Sort by', name: 'sortByLabel', desc: '', args: []);
  }

  /// `Farthest deadline`
  String get sortFarthestDeadline {
    return Intl.message(
      'Farthest deadline',
      name: 'sortFarthestDeadline',
      desc: '',
      args: [],
    );
  }

  /// `Least complete`
  String get sortLeastComplete {
    return Intl.message(
      'Least complete',
      name: 'sortLeastComplete',
      desc: '',
      args: [],
    );
  }

  /// `Most complete`
  String get sortMostComplete {
    return Intl.message(
      'Most complete',
      name: 'sortMostComplete',
      desc: '',
      args: [],
    );
  }

  /// `Nearest deadline`
  String get sortNearestDeadline {
    return Intl.message(
      'Nearest deadline',
      name: 'sortNearestDeadline',
      desc: '',
      args: [],
    );
  }

  /// `Newest`
  String get sortNewest {
    return Intl.message('Newest', name: 'sortNewest', desc: '', args: []);
  }

  /// `Oldest`
  String get sortOldest {
    return Intl.message('Oldest', name: 'sortOldest', desc: '', args: []);
  }

  /// `Closed`
  String get statusClosed {
    return Intl.message('Closed', name: 'statusClosed', desc: '', args: []);
  }

  /// `Completed`
  String get statusCompleted {
    return Intl.message(
      'Completed',
      name: 'statusCompleted',
      desc: '',
      args: [],
    );
  }

  /// `In transit`
  String get statusInTransit {
    return Intl.message(
      'In transit',
      name: 'statusInTransit',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get statusOpen {
    return Intl.message('Open', name: 'statusOpen', desc: '', args: []);
  }

  /// `Pending`
  String get statusPending {
    return Intl.message('Pending', name: 'statusPending', desc: '', args: []);
  }

  /// `Unknown`
  String get statusUnknown {
    return Intl.message('Unknown', name: 'statusUnknown', desc: '', args: []);
  }

  /// `Success`
  String get successTitle {
    return Intl.message('Success', name: 'successTitle', desc: '', args: []);
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `a day ago`
  String get timeAgoDay {
    return Intl.message('a day ago', name: 'timeAgoDay', desc: '', args: []);
  }

  /// `{days} days ago`
  String timeAgoDays(Object days) {
    return Intl.message(
      '$days days ago',
      name: 'timeAgoDays',
      desc: '',
      args: [days],
    );
  }

  /// `{hours} hours ago`
  String timeAgoHours(Object hours) {
    return Intl.message(
      '$hours hours ago',
      name: 'timeAgoHours',
      desc: '',
      args: [hours],
    );
  }

  /// `{minutes} minutes ago`
  String timeAgoMinutes(Object minutes) {
    return Intl.message(
      '$minutes minutes ago',
      name: 'timeAgoMinutes',
      desc: '',
      args: [minutes],
    );
  }

  /// `a month ago`
  String get timeAgoMonth {
    return Intl.message(
      'a month ago',
      name: 'timeAgoMonth',
      desc: '',
      args: [],
    );
  }

  /// `{months} months ago`
  String timeAgoMonths(Object months) {
    return Intl.message(
      '$months months ago',
      name: 'timeAgoMonths',
      desc: '',
      args: [months],
    );
  }

  /// `just now`
  String get timeAgoNow {
    return Intl.message('just now', name: 'timeAgoNow', desc: '', args: []);
  }

  /// `two days ago`
  String get timeAgoTwoDays {
    return Intl.message(
      'two days ago',
      name: 'timeAgoTwoDays',
      desc: '',
      args: [],
    );
  }

  /// `{years} years ago`
  String timeAgoYears(Object years) {
    return Intl.message(
      '$years years ago',
      name: 'timeAgoYears',
      desc: '',
      args: [years],
    );
  }

  /// `Today`
  String get todayLabel {
    return Intl.message('Today', name: 'todayLabel', desc: '', args: []);
  }

  /// `No user found for this email`
  String get userNotFoundByEmail {
    return Intl.message(
      'No user found for this email',
      name: 'userNotFoundByEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get validationEnterEmail {
    return Intl.message(
      'Please enter your email',
      name: 'validationEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get validationEnterFullName {
    return Intl.message(
      'Please enter your full name',
      name: 'validationEnterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get validationEnterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'validationEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get validationEnterPhone {
    return Intl.message(
      'Please enter your phone number',
      name: 'validationEnterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get validationEnterValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'validationEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get validationEnterValidPhone {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'validationEnterValidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 3 characters`
  String get validationNameMinLength {
    return Intl.message(
      'Name must be at least 3 characters',
      name: 'validationNameMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Include a lowercase letter`
  String get validationPasswordLowercase {
    return Intl.message(
      'Include a lowercase letter',
      name: 'validationPasswordLowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get validationPasswordMinLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'validationPasswordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Include a number`
  String get validationPasswordNumber {
    return Intl.message(
      'Include a number',
      name: 'validationPasswordNumber',
      desc: '',
      args: [],
    );
  }

  /// `Include a special character`
  String get validationPasswordSpecial {
    return Intl.message(
      'Include a special character',
      name: 'validationPasswordSpecial',
      desc: '',
      args: [],
    );
  }

  /// `Include an uppercase letter`
  String get validationPasswordUppercase {
    return Intl.message(
      'Include an uppercase letter',
      name: 'validationPasswordUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yesLabel {
    return Intl.message('Yes', name: 'yesLabel', desc: '', args: []);
  }

  /// `Yesterday`
  String get yesterdayLabel {
    return Intl.message(
      'Yesterday',
      name: 'yesterdayLabel',
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
