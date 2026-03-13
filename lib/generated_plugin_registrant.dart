import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_messaging_web/firebase_messaging_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
//  AudioplayersPlugin.registerWith(registrar);
//  FilePickerWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FirebaseMessagingWeb.registerWith(registrar);
//  FlutterNativeSplashWeb.registerWith(registrar);
 // ImagePickerPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
