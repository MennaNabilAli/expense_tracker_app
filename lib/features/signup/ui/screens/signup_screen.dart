import 'package:expense_tracker/features/signup/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/fonts.dart';
import '../../../login/ui/widgets/build_bloc_listener.dart';
import '../../../login/ui/widgets/email_and_pass_form.dart';
import '../widgets/build_bloc_listener_signup.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(70),
                  SignupForm(),
                  BuildBlocListenerSignUp()
                ],
              ),
            ),
          )
      ),
    );
  }
}
