import 'package:expense_tracker/features/login/ui/screens/login_screen.dart';
import 'package:expense_tracker/home_or_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/routing.dart';
import 'core/routing/routs.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routing});
  final Routing routing;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390 , 844),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mahfazty',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        home: HomeOrLogin(),
        onGenerateRoute: routing.generateRoute,
      ),
    );
  }
}