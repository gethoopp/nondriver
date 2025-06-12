import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ondriver/components/routes.dart';
import 'package:ondriver/firebase_options.dart';
import 'package:ondriver/view/dashboard_user/dashboard_user_screen.dart';
import 'package:ondriver/view/login_screen/login.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          initialRoute: Routes.login,
          routes: {
            Routes.login: (context) => LoginUserScreen(),
            Routes.dashboard: (context) => DashboardUserScreen(),
          },
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: child,
        );
      },
      child: LoginUserScreen(),
    );
  }
}
