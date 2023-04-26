import 'package:_happytone/src/features/authentication/db/db_helper.dart';
import 'package:_happytone/src/services/notification.dart';
import 'package:_happytone/src/services/theme_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/firebase_options.dart';
import 'package:_happytone/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:_happytone/src/repository/authentication_repository/authentication_repository.dart';
import 'package:_happytone/src/utils/theme/theme.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await DBHelper.initDb();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      // themeMode: ThemeMode.system,
      themeMode: ThemeService().theme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const SplashScreen(),
    );
  }
}
