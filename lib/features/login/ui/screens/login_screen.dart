import 'package:expense_tracker/core/helpers/spacing.dart';
import 'package:expense_tracker/core/theming/fonts.dart';
import 'package:expense_tracker/core/widgets/default_gradient_buutton.dart';
import 'package:expense_tracker/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routs.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/default_text_form_field.dart';
import '../widgets/build_bloc_listener.dart';
import '../widgets/email_and_pass_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                verticalSpace(130),
                EmailAndPassForm(),
                verticalSpace(20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      'By continuing, you agree to our Terms \n of use and privacy policy',
                      style: AppFont.font13GreyW300,
                      textAlign: TextAlign.center,
                  ),
                ),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Don\'t have an account?',
                        style: AppFont.font13WhiteW300,
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, Routes.signup);
                        },
                        child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppColors.yellowColor
                            ),
                        ))
                  ],
                ),
                BuildBlocListener(),
              ],
            ),
          )
      ),
    );
  }
}
