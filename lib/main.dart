import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ondriver/components/notification_local_listener.dart';

import 'package:ondriver/components/routes.dart';
import 'package:ondriver/controller/isar_controller/add_item.dart';
import 'package:ondriver/firebase_options.dart';
import 'package:ondriver/view/dashboard/dashboard_driver_screen.dart';

import 'package:ondriver/view/dashboard/dashboard_resto.dart';

import 'package:ondriver/view/dashboard/dashboard_user_screen.dart';
import 'package:ondriver/view/detail_screen_card/detail_screen_order.dart';

import 'package:ondriver/view/login_screen/login.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Init Isar
  await IsarService.init();
  NotificationListenerLocal.init;
  runApp(const MyApp());
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
            Routes.detailCart: (context) => DetailScreen(),
            Routes.dashBoardResto: (context) => DashboardRestoScreen(),
            Routes.dashBordDriver: (context) => DriverScreen(),
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
