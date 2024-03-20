import 'package:expense_tracker/features/home/ui/screens/home_screen.dart';
import 'package:expense_tracker/features/login/ui/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeOrLogin extends StatelessWidget {
  const HomeOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.active){
            User ? user = snapshot.data as User?;
            if(user == null){
              return LoginScreen();
            }
            else{
              return HomeScreen();
            }
          }
          return Center(child: CircularProgressIndicator());
        },
    );
  }
}
