// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file: strict_top_level_inference,unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(collected, total) => "Collected ${collected} / ${total}";

  static String m1(days) => "Ends in ${days} days";

  static String m2(name) => "Hello, ${name}";

  static String m3(bloodType) => "Matching blood type: ${bloodType}";

  static String m4(email) => "Enter the code sent to ${email}";

  static String m5(time) => "Resend in ${time}";

  static String m6(percent) => "Completion ${percent}%";

  static String m7(date) => "Request date: ${date}";

  static String m8(days) => "${days} days ago";

  static String m9(hours) => "${hours} hours ago";

  static String m10(minutes) => "${minutes} minutes ago";

  static String m11(months) => "${months} months ago";

  static String m12(years) => "${years} years ago";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addRqustBtn": MessageLookupByLibrary.simpleMessage("Create Request"),
    "age": MessageLookupByLibrary.simpleMessage("Age"),
    "areForgPass": MessageLookupByLibrary.simpleMessage("Forget Password?"),
    "bloodType": MessageLookupByLibrary.simpleMessage("Blood Type"),
    "bloodTypeLabel": MessageLookupByLibrary.simpleMessage("Blood type"),
    "caseDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "Enter case description",
    ),
    "caseDescriptionLabel": MessageLookupByLibrary.simpleMessage(
      "Case description",
    ),
    "caseDetailsTitle": MessageLookupByLibrary.simpleMessage("Case details"),
    "caseInfoLabel": MessageLookupByLibrary.simpleMessage("Case information"),
    "caseNameHint": MessageLookupByLibrary.simpleMessage("Enter case name"),
    "caseNameLabel": MessageLookupByLibrary.simpleMessage("Case name"),
    "changePass": MessageLookupByLibrary.simpleMessage("Change Password"),
    "changePassDesc": MessageLookupByLibrary.simpleMessage(
      "Enter your current password, then the new one",
    ),
    "change_password": MessageLookupByLibrary.simpleMessage("Change Password"),
    "city": MessageLookupByLibrary.simpleMessage("Governorate"),
    "cityCenterLabel": MessageLookupByLibrary.simpleMessage("City center"),
    "cityLabel": MessageLookupByLibrary.simpleMessage("City"),
    "collectedBagsCount": m0,
    "completeRequiredFields": MessageLookupByLibrary.simpleMessage(
      "Please complete all required fields",
    ),
    "confirmLabel": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmNewPass": MessageLookupByLibrary.simpleMessage(
      "Confirm new password",
    ),
    "confirmPass": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "confirmPassForget": MessageLookupByLibrary.simpleMessage(
      "Confirm your email",
    ),
    "createAcc": MessageLookupByLibrary.simpleMessage("Create Account"),
    "createDonationRequestTitle": MessageLookupByLibrary.simpleMessage(
      "Create donation request",
    ),
    "currentPass": MessageLookupByLibrary.simpleMessage("Current Password"),
    "dash": MessageLookupByLibrary.simpleMessage("-"),
    "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of Birth"),
    "dateOfBirthRequired": MessageLookupByLibrary.simpleMessage(
      "Please select your date of birth",
    ),
    "defaultAvatarInitial": MessageLookupByLibrary.simpleMessage("D"),
    "defaultCity": MessageLookupByLibrary.simpleMessage("Unknown city"),
    "defaultUserName": MessageLookupByLibrary.simpleMessage("User"),
    "descriptionLabel": MessageLookupByLibrary.simpleMessage("Description"),
    "doYouforgetPass": MessageLookupByLibrary.simpleMessage(
      "Forgot your password?",
    ),
    "donateNow": MessageLookupByLibrary.simpleMessage("Donate now"),
    "donationDeadlineLabel": MessageLookupByLibrary.simpleMessage(
      "Donation deadline:",
    ),
    "donationInfoLabel": MessageLookupByLibrary.simpleMessage(
      "Donation information",
    ),
    "donationSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Donation recorded successfully",
    ),
    "donationTypeHint": MessageLookupByLibrary.simpleMessage(
      "Select donation type",
    ),
    "donationsCountLabel": MessageLookupByLibrary.simpleMessage("Donations"),
    "donorResponsesTitle": MessageLookupByLibrary.simpleMessage(
      "Donor responses",
    ),
    "donorsLabel": MessageLookupByLibrary.simpleMessage("Donors"),
    "dontHaveAcc": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "earlierLabel": MessageLookupByLibrary.simpleMessage("Earlier"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "endsInDays": m1,
    "enterNewPass": MessageLookupByLibrary.simpleMessage(
      "Enter a new password for your account",
    ),
    "entrEmail": MessageLookupByLibrary.simpleMessage("Enter your email"),
    "entrFullName": MessageLookupByLibrary.simpleMessage(
      "Enter your full name",
    ),
    "entrPassw": MessageLookupByLibrary.simpleMessage("***********"),
    "entrPhoneNum": MessageLookupByLibrary.simpleMessage(
      "Enter your phone number",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Error"),
    "filterSortTitle": MessageLookupByLibrary.simpleMessage("Filter & Sort"),
    "forgPassValidate": MessageLookupByLibrary.simpleMessage(
      "Enter your email address and we will send you an OTP code to reset your password.",
    ),
    "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "genderFemale": MessageLookupByLibrary.simpleMessage("Female"),
    "genderMale": MessageLookupByLibrary.simpleMessage("Male"),
    "genericErrorRetry": MessageLookupByLibrary.simpleMessage(
      "Something went wrong. Try again.",
    ),
    "genericLoadError": MessageLookupByLibrary.simpleMessage(
      "Failed to load data",
    ),
    "googleLoginFailed": MessageLookupByLibrary.simpleMessage(
      "Google login failed",
    ),
    "googleTokenError": MessageLookupByLibrary.simpleMessage(
      "Google token error",
    ),
    "governorateLabel": MessageLookupByLibrary.simpleMessage("Governorate"),
    "greeting": m2,
    "haveAcc": MessageLookupByLibrary.simpleMessage("Already have an account?"),
    "helpCasesLabel": MessageLookupByLibrary.simpleMessage("Helped cases"),
    "hosName": MessageLookupByLibrary.simpleMessage(
      "Search with hospital name",
    ),
    "hospitalNameHint": MessageLookupByLibrary.simpleMessage("Hospital name"),
    "incompleteDataDesc": MessageLookupByLibrary.simpleMessage(
      "Please complete all required fields",
    ),
    "incompleteDataTitle": MessageLookupByLibrary.simpleMessage(
      "Incomplete data",
    ),
    "lastDeadlineLabel": MessageLookupByLibrary.simpleMessage("Last deadline"),
    "liveLabel": MessageLookupByLibrary.simpleMessage("Live"),
    "loadingLabel": MessageLookupByLibrary.simpleMessage("Loading..."),
    "locationTitle": MessageLookupByLibrary.simpleMessage("Location"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginHere": MessageLookupByLibrary.simpleMessage("Login here"),
    "loginSucc": MessageLookupByLibrary.simpleMessage("Successful Login"),
    "loginSuccDesc": MessageLookupByLibrary.simpleMessage("Welcome back !"),
    "loginWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Login with Google",
    ),
    "logoutConfirmMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to log out?",
    ),
    "logoutLabel": MessageLookupByLibrary.simpleMessage("Logout"),
    "makeAcc": MessageLookupByLibrary.simpleMessage("Create an account"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage("Mark all as read"),
    "matchingBloodType": m3,
    "motivationalStart": MessageLookupByLibrary.simpleMessage(
      "Start your first donation today",
    ),
    "motivationalThanks": MessageLookupByLibrary.simpleMessage(
      "Thank you for your help",
    ),
    "motivationalTopDonor": MessageLookupByLibrary.simpleMessage(
      "You\'re a top donor!",
    ),
    "myBloodTypeOnly": MessageLookupByLibrary.simpleMessage(
      "My blood type only",
    ),
    "myInfoTitle": MessageLookupByLibrary.simpleMessage("My information"),
    "myRequestsTitle": MessageLookupByLibrary.simpleMessage("My requests"),
    "navHome": MessageLookupByLibrary.simpleMessage("Home"),
    "navNotifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "navProfile": MessageLookupByLibrary.simpleMessage("Profile"),
    "navRequests": MessageLookupByLibrary.simpleMessage("Requests"),
    "nearbyRequestsTitle": MessageLookupByLibrary.simpleMessage(
      "Nearby requests",
    ),
    "newPass": MessageLookupByLibrary.simpleMessage("New passowrd"),
    "noLabel": MessageLookupByLibrary.simpleMessage("No"),
    "noNotifications": MessageLookupByLibrary.simpleMessage("No notifications"),
    "noRequestsDescription": MessageLookupByLibrary.simpleMessage(
      "No requests available right now",
    ),
    "noRequestsTitle": MessageLookupByLibrary.simpleMessage("No requests"),
    "noRequestsYet": MessageLookupByLibrary.simpleMessage("No requests yet"),
    "noResponsesYet": MessageLookupByLibrary.simpleMessage("No responses yet"),
    "notificationBloodRequestTitle": MessageLookupByLibrary.simpleMessage(
      "Blood request",
    ),
    "notificationDetailsTitle": MessageLookupByLibrary.simpleMessage(
      "Notification details",
    ),
    "notificationDonorAcceptedTitle": MessageLookupByLibrary.simpleMessage(
      "Donor accepted",
    ),
    "notificationImportantAlertTitle": MessageLookupByLibrary.simpleMessage(
      "Important alert",
    ),
    "notificationRequestCompletedTitle": MessageLookupByLibrary.simpleMessage(
      "Request completed",
    ),
    "notificationSettingsTitle": MessageLookupByLibrary.simpleMessage(
      "Notification settings",
    ),
    "notificationThankYouTitle": MessageLookupByLibrary.simpleMessage(
      "Thank you",
    ),
    "notificationsTitle": MessageLookupByLibrary.simpleMessage("Notifications"),
    "onTheWay": MessageLookupByLibrary.simpleMessage("On the way"),
    "onbrd1Descr": MessageLookupByLibrary.simpleMessage(
      "Help save lives with a simple step!",
    ),
    "onbrd1Title": MessageLookupByLibrary.simpleMessage("Donate Blood Easily"),
    "onbrd2Descr": MessageLookupByLibrary.simpleMessage(
      "We\'ll locate the nearest donation center so you can help quickly",
    ),
    "onbrd2Title": MessageLookupByLibrary.simpleMessage(
      "Find the Nearest Person",
    ),
    "onbrd3Descr": MessageLookupByLibrary.simpleMessage(
      "Every donation can save a life",
    ),
    "onbrd3Title": MessageLookupByLibrary.simpleMessage(
      "Your Donation Makes a Difference",
    ),
    "onbrd4Descr": MessageLookupByLibrary.simpleMessage(
      "Thank you for joining the journey of giving and change.",
    ),
    "onbrd4Title": MessageLookupByLibrary.simpleMessage("Welcome"),
    "operationFailedTitle": MessageLookupByLibrary.simpleMessage(
      "Operation failed",
    ),
    "operationSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "Operation successful",
    ),
    "otpEnterCode": m4,
    "otpResendCode": MessageLookupByLibrary.simpleMessage("Resend code"),
    "otpResendIn": m5,
    "otpResent": MessageLookupByLibrary.simpleMessage("Code resent"),
    "paginationNext": MessageLookupByLibrary.simpleMessage("Next"),
    "paginationPrev": MessageLookupByLibrary.simpleMessage("Previous"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordChangedSuccess": MessageLookupByLibrary.simpleMessage(
      "Password changed successfully",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "patientNameLabel": MessageLookupByLibrary.simpleMessage("Patient name"),
    "phoneNum": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneNumberLabel": MessageLookupByLibrary.simpleMessage("Phone number"),
    "placeInfoLabel": MessageLookupByLibrary.simpleMessage(
      "Location information",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy policy"),
    "profileActivityTitle": MessageLookupByLibrary.simpleMessage("Activity"),
    "regFail": MessageLookupByLibrary.simpleMessage("Register Failed"),
    "regSucc": MessageLookupByLibrary.simpleMessage("Successful Register"),
    "regSuccDesc": MessageLookupByLibrary.simpleMessage(
      "Verify your account then go to login page",
    ),
    "registerSuccessDesc": MessageLookupByLibrary.simpleMessage(
      "Verify your account then log in",
    ),
    "registerSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "Registration successful",
    ),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Remember Me"),
    "requestArrived": MessageLookupByLibrary.simpleMessage("Arrived"),
    "requestClosedMessage": MessageLookupByLibrary.simpleMessage(
      "No longer accepting requests",
    ),
    "requestCompletionPercent": m6,
    "requestCreatedSuccessDesc": MessageLookupByLibrary.simpleMessage(
      "Request created successfully",
    ),
    "requestDate": m7,
    "requestDetailsTitle": MessageLookupByLibrary.simpleMessage(
      "Request details",
    ),
    "requestPublisher": MessageLookupByLibrary.simpleMessage(
      "Request publisher",
    ),
    "requestRequired": MessageLookupByLibrary.simpleMessage("Required"),
    "requiredDonorsCount": MessageLookupByLibrary.simpleMessage(
      "Required donors",
    ),
    "resetLabel": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetPass": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "resetPasswordSuccessDesc": MessageLookupByLibrary.simpleMessage(
      "Password reset successful",
    ),
    "retryLabel": MessageLookupByLibrary.simpleMessage("Retry"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "savePass": MessageLookupByLibrary.simpleMessage("Save Password"),
    "selectCity": MessageLookupByLibrary.simpleMessage("Select city"),
    "selectDate": MessageLookupByLibrary.simpleMessage("Select date"),
    "selectDateOfBirth": MessageLookupByLibrary.simpleMessage(
      "Select date of birth",
    ),
    "selectGovernorate": MessageLookupByLibrary.simpleMessage(
      "Select governorate",
    ),
    "selectValidCity": MessageLookupByLibrary.simpleMessage(
      "Please select a valid city",
    ),
    "sendOtp": MessageLookupByLibrary.simpleMessage("Send OTP"),
    "serverConnectionFailedDesc": MessageLookupByLibrary.simpleMessage(
      "Unable to reach server. Try again.",
    ),
    "serverConnectionFailedTitle": MessageLookupByLibrary.simpleMessage(
      "Connection failed",
    ),
    "showResults": MessageLookupByLibrary.simpleMessage("Show results"),
    "skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "sortByLabel": MessageLookupByLibrary.simpleMessage("Sort by"),
    "sortFarthestDeadline": MessageLookupByLibrary.simpleMessage(
      "Farthest deadline",
    ),
    "sortLeastComplete": MessageLookupByLibrary.simpleMessage("Least complete"),
    "sortMostComplete": MessageLookupByLibrary.simpleMessage("Most complete"),
    "sortNearestDeadline": MessageLookupByLibrary.simpleMessage(
      "Nearest deadline",
    ),
    "sortNewest": MessageLookupByLibrary.simpleMessage("Newest"),
    "sortOldest": MessageLookupByLibrary.simpleMessage("Oldest"),
    "startNow": MessageLookupByLibrary.simpleMessage("Start Now"),
    "statusClosed": MessageLookupByLibrary.simpleMessage("Closed"),
    "statusCompleted": MessageLookupByLibrary.simpleMessage("Completed"),
    "statusInTransit": MessageLookupByLibrary.simpleMessage("In transit"),
    "statusOpen": MessageLookupByLibrary.simpleMessage("Open"),
    "statusPending": MessageLookupByLibrary.simpleMessage("Pending"),
    "statusUnknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "successTitle": MessageLookupByLibrary.simpleMessage("Success"),
    "termsAndConditions": MessageLookupByLibrary.simpleMessage(
      "Terms & Conditions",
    ),
    "timeAgoDay": MessageLookupByLibrary.simpleMessage("a day ago"),
    "timeAgoDays": m8,
    "timeAgoHours": m9,
    "timeAgoMinutes": m10,
    "timeAgoMonth": MessageLookupByLibrary.simpleMessage("a month ago"),
    "timeAgoMonths": m11,
    "timeAgoNow": MessageLookupByLibrary.simpleMessage("just now"),
    "timeAgoTwoDays": MessageLookupByLibrary.simpleMessage("two days ago"),
    "timeAgoYears": m12,
    "todayLabel": MessageLookupByLibrary.simpleMessage("Today"),
    "town": MessageLookupByLibrary.simpleMessage("City"),
    "userNotFoundByEmail": MessageLookupByLibrary.simpleMessage(
      "No user found for this email",
    ),
    "validationEnterEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter your email",
    ),
    "validationEnterFullName": MessageLookupByLibrary.simpleMessage(
      "Please enter your full name",
    ),
    "validationEnterPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter your password",
    ),
    "validationEnterPhone": MessageLookupByLibrary.simpleMessage(
      "Please enter your phone number",
    ),
    "validationEnterValidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email",
    ),
    "validationEnterValidPhone": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid phone number",
    ),
    "validationNameMinLength": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 3 characters",
    ),
    "validationPasswordLowercase": MessageLookupByLibrary.simpleMessage(
      "Include a lowercase letter",
    ),
    "validationPasswordMinLength": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters",
    ),
    "validationPasswordNumber": MessageLookupByLibrary.simpleMessage(
      "Include a number",
    ),
    "validationPasswordSpecial": MessageLookupByLibrary.simpleMessage(
      "Include a special character",
    ),
    "validationPasswordUppercase": MessageLookupByLibrary.simpleMessage(
      "Include an uppercase letter",
    ),
    "yesLabel": MessageLookupByLibrary.simpleMessage("Yes"),
    "yesterdayLabel": MessageLookupByLibrary.simpleMessage("Yesterday"),
  };
}
