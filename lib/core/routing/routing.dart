import 'package:expense_tracker/core/routing/routs.dart';
import 'package:expense_tracker/features/login/logic/cubit/login_cubit.dart';
import 'package:expense_tracker/features/login/ui/screens/login_screen.dart';
import 'package:expense_tracker/features/signup/logic/cubit/signup_cubit.dart';
import 'package:expense_tracker/features/signup/ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../networking/firebase_helper.dart';

class Routing {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (BuildContext context) => LoginCubit(FireBaseHelper()),
                child: const LoginScreen()));
      case Routes.signup:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (BuildContext context) => SignupCubit(FireBaseHelper()),
            child: const SignupScreen()));
        default:
        return MaterialPageRoute(builder: (context) => const NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No Route Found'),
      ),
    );
  }
}
