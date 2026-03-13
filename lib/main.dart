import 'package:clothesget/core/constants/app_colors.dart';
import 'package:clothesget/services/notifiction_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/app_config.dart';
import 'core/utils/shared_prefs_helper.dart';
import 'features/home/view/home_view.dart';
import 'features/login/view/login.dart';
import 'firebase_options.dart';
import 'middleware/middleware.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
Future<void> fierbaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() async {
  //await dotenv.load(fileName: ".env");
  try {
    await dotenv.load(fileName: ".env") ;// محاولة تحميل .env
    print("Loaded .env file successfully");
  } catch (e) {
    print("Error loading .env file: $e");  // سجل الأخطاء في حالة حدوث مشكلة
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPrefsHelper.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  String s = await NotificationServices().getDeviceToken();
  NotificationServices().requestNotificationPermission();
  NotificationServices().firebaseInit();
  FirebaseMessaging.onBackgroundMessage(fierbaseMessagingBackgroundHandler);
  await NotificationServices.sendToken(s);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        locale: const Locale(AppConfig.defaultLanguage),
        theme: ThemeData(
            textTheme: GoogleFonts.cairoTextTheme(),
            appBarTheme:
                const AppBarTheme(iconTheme: IconThemeData(color: AppColors.white))),
        debugShowCheckedModeBanner: false,
        initialRoute: "/login",
        getPages: [
          GetPage(
              name: "/login",
              page: () => const Login(),
              middlewares: [AuthMiddlewar()]),
          GetPage(name: "/home", page: () => const HomeView()),
        ]);
  }
}
