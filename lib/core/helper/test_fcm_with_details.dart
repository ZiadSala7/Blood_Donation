import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> testFCMWithDetails() async {
  await Future.delayed(const Duration(seconds: 2));

  log('\n========================================');
  log('🔍 FCM DIAGNOSTIC TEST');
  log('========================================\n');

  // Test 1: Can we create FirebaseMessaging instance?
  try {
    FirebaseMessaging.instance;
    log('✅ Step 1: FirebaseMessaging instance created');
  } catch (e) {
    log('❌ Step 1 FAILED: Cannot create FirebaseMessaging instance');
    log('   Error: $e');
    return;
  }

  // Test 2: Can we request permissions?
  try {
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    log('✅ Step 2: Permission requested');
    log('   Authorization: ${settings.authorizationStatus}');
  } catch (e) {
    log('❌ Step 2 FAILED: Cannot request permissions');
    log('   Error: $e');
  }

  // Test 3: Can we get APNs token? (This checks service availability)
  try {
    final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    log('✅ Step 3: APNs check complete (token: $apnsToken)');
  } catch (e) {
    log('⚠️  Step 3: APNs not available (expected on Android)');
  }

  // Test 4: The critical one - Get FCM token
  log('\n🎯 Step 4: Attempting to get FCM token...');
  log('   This is where the error usually occurs...\n');

  try {
    final token = await FirebaseMessaging.instance.getToken().timeout(
      const Duration(seconds: 20),
      onTimeout: () {
        log('⏱️  TIMEOUT after 20 seconds');
        return null;
      },
    );

    if (token != null) {
      log('✅✅✅ SUCCESS! FCM Token received!');
      log(
        'Token (first 40 chars): ${token.substring(0, token.length > 40 ? 40 : token.length)}...',
      );
    } else {
      log('❌ Token is null (timeout or service unavailable)');
    }
  } on FirebaseException catch (e) {
    log('❌❌❌ FIREBASE EXCEPTION CAUGHT');
    log('   Plugin: ${e.plugin}');
    log('   Code: ${e.code}');
    log('   Message: ${e.message}');

    if (e.message?.contains('SERVICE_NOT_AVAILABLE') == true) {
      log('\n💡 DIAGNOSIS: SERVICE_NOT_AVAILABLE');
      log('   This means:');
      log(
        '   1. Google Play Services is NOT installed on this device/emulator',
      );
      log('   2. OR Google Play Services is disabled');
      log('   3. OR Google Play Services is too old');
      log('\n   SOLUTION:');
      log('   → Use an emulator WITH Google Play Store installed');
      log('   → Look for emulators with 🏪 Play Store icon');
      log('   → In AVD Manager, choose system images labeled "Google Play"');
    }
  } catch (e) {
    log('❌ UNEXPECTED ERROR: $e');
    log('   Type: ${e.runtimeType}');
  }

  log('\n========================================');
  log('📊 DIAGNOSTIC COMPLETE');
  log('========================================\n');
}
